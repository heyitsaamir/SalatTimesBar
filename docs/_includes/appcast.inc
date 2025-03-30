<?xml version="1.0" encoding="utf-8"?>
<rss version="2.0" xmlns:sparkle="http://www.andymatuschak.org/xml-namespaces/sparkle" xmlns:dc="http://purl.org/dc/elements/1.1/">
    <channel>
        <title>{{ site.github.project_title }}</title>
        <description>Most recent changes with links to updates.</description>
        <language>en</language>
        {% for release in site.github.releases %}
            {% unless release.draft %}
                {% unless release.prerelease and page.release_only %}
                    {% assign versions = release.name | split: '.' %}
                    {% if versions.size == 3 %}
                        {% assign major_version = versions[0] | plus: 0 %}
                        {% assign minor_version = versions[1] | plus: 0 %}
                        {% assign patch_version = versions[2] | plus: 0 %}
                        {% if major_version >= 0 and minor_version >= 0 and patch_version >= 0 %}
                            <item>
                                <title>Version {{ release.name }}</title>
                                <description><![CDATA[{{ release.body | markdownify }}]]></description>
                                <pubDate>{{ release.published_at | date_to_rfc822 }}</pubDate>
                                <sparkle:version>{{ release.name }}</sparkle:version>
                                <link>{{ release.html_url }}</link>
                                {% for asset in release.assets limit:1 %}
                                    <enclosure
                                        url="{{ asset.browser_download_url }}"
                                        sparkle:version="{{ release.name }}"
                                        length="{{ asset.size }}"
                                        type="application/octet-stream" />
                                {% endfor %}
                            </item>
                        {% endif %}
                    {% endif %}
                {% endunless %}
            {% endunless %}
        {% endfor %}
    </channel>
</rss>