Feature: Filtering books

    Scenario Outline: Filter the book from book store
        Given I have the following books in the store
            | title     | author      |
            | The Devil | Erik Larson |
            | The Lion  | C.S Lewis   |
            | The Beast | Erik Larson |
        When I filter books by author '<author>'
        Then I find <bookcount> books

        Examples:
            | author      | bookcount |
            | Erik Larson | 2         |
            | C.S Lewis   | 1         |