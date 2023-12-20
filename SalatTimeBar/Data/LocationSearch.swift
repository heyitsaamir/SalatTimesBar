//
//  LocationSearch.swift
//  SalatTimeBar
//
//  Created by Aamir Jawaid on 12/18/23.
//

import Foundation
import MapKit
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

class LocationSearch: NSObject, ObservableObject {
    private var cancellables : Set<AnyCancellable> = []
        
    private var searchCompleter = MKLocalSearchCompleter()
    private var currentPromise : ((Result<[MKLocalSearchCompletion], Error>) -> Void)?
    
    @Published var locationResults : [Location] = []
    @Published var searchTerm = ""
    
    override init() {
    super.init()
    searchCompleter.delegate = self
    
    $searchTerm
        .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
        .removeDuplicates()
        .flatMap({ (currentSearchTerm) in
            self.searchTermToResults(searchTerm: currentSearchTerm)
        })
        .sink(receiveCompletion: { (completion) in
            //handle error
        }, receiveValue: { (results) in
            self.locationResults = results.map({ res in
                Location(title: res.title, description: res.subtitle)
            })
        })
        .store(in: &cancellables)
    }
    
    func searchTermToResults(searchTerm: String) -> Future<[MKLocalSearchCompletion], Error> {
        Future { promise in
            self.searchCompleter.queryFragment = searchTerm
            self.currentPromise = promise
        }
    }
}

extension LocationSearch : MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        currentPromise?(.success(completer.results))
    }
    
    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
        //could deal with the error here, but beware that it will finish the Combine publisher stream
        //currentPromise?(.failure(error))
    }
}
