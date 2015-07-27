describe('Simple Suite', function() {
	it('Spec 1', function() {
		expect(1+1).toEqual(2);
	});

	it('Spec 2 Fail', function() {
		expect(1+1).toEqual(3);
	});	
});

describe('Suite with setup only', function() {
	beforeEach(function(){
		expect(1+1).toEqual(2);
	});

	it('Spec 1', function() {
		expect(1+1).toEqual(2);
	});
	
	it('Spec 2', function() {
		expect(1-1).toEqual(0);
	});

});


describe('Suite with teardown only', function() {	
	it('Spec 1', function() {
		expect(1+1).toEqual(2);
	});
	
	it('Spec 2', function() {
		expect(1-1).toEqual(0);
	});

	afterEach(function(){
		expect(1+1).toEqual(2);
	});
});

describe('Suite with setup and teardown', function() {
	beforeEach(function(){
		expect(1+1).toEqual(2);
	});

	it('Spec 1 Fail', function() {
		expect(1+1).toEqual(12);
	});
	
	it('Spec 2', function() {
		expect(1-1).toEqual(0);
	});

	afterEach(function(){
		expect(1+1).toEqual(2);
	});
});