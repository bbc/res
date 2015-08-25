xdescribe('Disabled suite', function() {
	it('Spec 1 Fail', function() {
		expect(1+1).toEqual(5);
	});

	it('Spec 2', function() {
		expect(1+1).toEqual(2);
	});

	it('Spec 3', function() {
		expect(1+1).toEqual(2);
	});

});


describe('Few Pending specs', function() {
	xit('Spec 1', function() {
		expect(1+1).toEqual(2);
	});

	it('Spec 2', function() {
		expect(1+1).toEqual(2);
	});

	xit('Spec 3', function() {
		expect(1+1).toEqual(2);
	});

	it('Spec 4 Fail', function() {
		expect(1+1).toEqual(12);
	});
});