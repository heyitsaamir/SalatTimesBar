//
//  LocationSearch.swift
//  SalatTimeBar
//
//  Created by Aamir Jawaid on 12/18/23.
//

import Foundation
import Combine

struct Location: Identifiable, Hashable {
    var id: Int {
        return hashValue
    }
    
    public let title: String
    public let subtitle: String
    
    init(title: String, description: String) {
        self.title = title
        self.subtitle = description
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
        hasher.combine(subtitle)
    }
}

struct NominatimResponse: Codable {
    let displayName: String
    let lat: String
    let lon: String
    let type: String
    
    enum CodingKeys: String, CodingKey {
        case displayName = "display_name"
        case lat, lon, type
    }
}

class LocationSearch: ObservableObject {
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var locationResults: [Location] = []
    @Published var searchTerm = ""
    
    init() {
        $searchTerm
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .removeDuplicates()
            .filter { !$0.isEmpty }
            .flatMap { searchTerm in
                self.searchLocations(query: searchTerm)
            }
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { [weak self] results in
                    self?.locationResults = results
                }
            )
            .store(in: &cancellables)
    }
    
    private func searchLocations(query: String) -> AnyPublisher<[Location], Never> {
        let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let urlString = "https://nominatim.openstreetmap.org/search?city=\(encodedQuery)&format=json&limit=10"
        
        guard let url = URL(string: urlString) else {
            return Just([]).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.setValue("YourAppName", forHTTPHeaderField: "User-Agent") // Required by Nominatim
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: [NominatimResponse].self, decoder: JSONDecoder())
            .map { responses in
                responses.map { response in
                    Location(
                        title: response.displayName,
                        description: "\(response.type): \(response.lat), \(response.lon)"
                    )
                }
            }
            .replaceError(with: [])
            .eraseToAnyPublisher()
    }
}
