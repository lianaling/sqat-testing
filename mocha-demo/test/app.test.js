// We first import 'chai'
const { expect } = require('chai');
const { add } = require('../src/app');

// with describe(), we describe the function that we are testing
describe('the add function', () => {

    // with it(), we test a distinct behavior of the function
    it('should add 2 numbers together', () => {
        // we first get the result
        const result = add(4, 4);

        // then we check whether it is what we expect
        expect(result).to.be.eq(6);
    });

    // we can have multiple it() to test different behavior of the function
    it('should be able to handle 1 number', () => {
        const result = add(2);
        expect(result).to.be.eq(2);
    });

    it('should be able to handle 0 number', () => {
        const result = add();
        expect(result).to.be.eq(0);
    });

    it('should return 0 if either argument given is not a number', () => {
        const result = add(2, 'string');
        expect(result).to.be.eq(0);
    });
});