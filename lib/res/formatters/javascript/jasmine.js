var jasmineReporter ={  

jasmine_format: {},
suite_info: [],
spec: {},
suite_count: 0,
spec_count: 0,

jasmineStarted: function(suiteInfo) {
  this.jasmine_format["started"] = new Date().toUTCString();
  this.jasmine_format["type"] = "Jasmine"
},

suiteStarted: function(result) {
# suite object initialization
  this.suite_info[this.suite_count] = result;
  this.suite_info[this.suite_count]["started"] = new Date().toUTCString();
  this.suite_count++;
},

specStarted: function(result) {
// spec object initialization
  this.spec[this.spec_count] = {}
  this.spec[this.spec_count]["name"] = result.description;
  this.spec[this.spec_count]["fullName"] = result.fullName;
  this.spec[this.spec_count]["started"] = new Date().toUTCString();
},

specDone: function(result) {
  this.spec[this.spec_count]["status"] = result.status;
  var i = this.suite_count - 1;
  
// Attach specs to corresponding suite
  suite_name = this.spec[this.spec_count]["fullName"].replace(this.spec[this.spec_count]["name"],"").trim();
  while(i > 0){
    if(suite_name == this.suite_info[i]["fullName"]){
      if(typeof this.suite_info[i]["children"] == "undefined"){
        this.suite_info[i]["children"] = []
        this.suite_info[i]["children"][0] = this.spec[this.spec_count];
      }else{
        var k = this.suite_info[i]["children"].length;
        this.suite_info[i]["children"][k] = this.spec[this.spec_count];
      }
    }
    i--;
  }
  this.spec[this.spec_count]["finished"] = new Date().toUTCString();
  this.spec_count ++;
},

suiteDone: function(result) {
// Suite final assignments and attachment to parent suite
  var i = this.suite_count - 1;
  var index = 0;
  var k = 0;

  while(i > 0){
    if(this.suite_info[i]["description"] == result.description){
      index = i;
      break;
    }
    i--;
  }
  
  if(typeof this.suite_info[index]["children"] != "undefined"){
    while(k < this.suite_info[index]["children"].length){
      if(this.suite_info[index]["children"][k]["status"] == "failed"){
        this.suite_info[index]["status"] = "failed";
        k = this.suite_info[index]["children"].length;
      }else{
        this.suite_info[index]["status"] = "passed";
      }
      k++;
    }
    k = 0;
  }
  this.suite_info[index]["finished"] = new Date().toUTCString();
  console.log(this.suite_info);
},

jasmineDone: function() {
// Attach suites to parent suites (which are already not attached). Set the parent suite status
  var k = this.suite_count - 1; 
  while(k > 0){
    parent = this.suite_info[k]["fullName"].replace(this.suite_info[k]["description"],"").trim();
    if(parent != ""){
      for(var i = 0; i < k; i++){
        if(parent == this.suite_info[i]["fullName"]){
          if(typeof this.suite_info[i]["children"] == "undefined"){
            this.suite_info[i]["children"] = []
            this.suite_info[i]["children"][0] = this.suite_info[k];
            this.suite_info[i]["status"] = status(this.suite_info[i]["status"], this.suite_info[k]["status"])
            this.suite_info = remove(this.suite_info, k);
          }else{
            var p = this.suite_info[i]["children"].length;
            this.suite_info[i]["children"][p] = this.suite_info[k];         
            this.suite_info[i]["status"] = status(this.suite_info[i]["status"], this.suite_info[i]["status"])
            this.suite_info = remove(this.suite_info, k);
          }
        }
      }
    }
    k--;
  }
this.jasmine_format["finished"] = new Date().toUTCString();
this.jasmine_format["results"] = this.suite_info;
return JSON.stringify(this.jasmine_format)
},

};

// Returns the status of suite
function status(current_status, status){
  if(status == "failed"){
    return "failed";
  }else{
    if(current_status != "failed"){
      return "passed"
    }
  }
}

// Remove empty or unused array slot
function remove(suite, position){
  suite.splice(position, 1);
  return suite;
}