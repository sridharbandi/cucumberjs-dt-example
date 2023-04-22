const {Given, When, Then} = require('@cucumber/cucumber');
const {expect, assert} = require('chai');

let books = []
let results = []
Given('I have the following books in the store', function (dataTable) {
    books = dataTable.hashes()
});

When('I filter books by author {string}', function (author) {
    results = books.filter(book => book.author == author)
});

Then('I find {int} books', function (count) {
    expect(results.length).to.equal(count)
    console.log(results)
});