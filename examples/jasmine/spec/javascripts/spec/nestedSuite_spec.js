describe('Nested - Outer Suite - Type 1', function() {
	describe('Nested - Inner Suite', function() {	
		it('Spec 1 Fail', function() {
			expect(1+1).toEqual(3);
		});

		it('Spec 2', function() {
			expect(1+1).toEqual(2);
		});
	});
});



describe('Nested - Outer Suite - Type 2', function() {
	it('Spec 1', function() {
			expect(1+1).toEqual(2);
	});

	it('Spec 2 Fail', function() {
			expect(1+1).toEqual(3);
	});

	describe('Nested - Inner Suite', function() {
		it('Spec 1', function() {
			expect(1+1).toEqual(2);
		});

		it('Spec 2 Fail', function() {
			expect(1+1).toEqual(1);
		});
	});
});


describe('Nested Disbled suites and Pending specs', function() {
	xdescribe('Disabled Suite', function() {
		it('Spec 1', function() {
			expect(1+1).toEqual(2);
		});
		it('Spec 2', function() {
			expect(1+1).toEqual(2);
		});
	});

	describe('Pending specs', function() {
		xit('Spec 1', function() {
			expect(1+1).toEqual(2);
		});
		xit('Spec 2 Fail', function() {
			expect(1+1).toEqual(4);
		});
		xit('Spec 3', function() {
			expect(1+1).toEqual(2);
		});
	});
});
