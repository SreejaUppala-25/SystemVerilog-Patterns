// Define a class 'packet' to hold random variables and constraints
class packet;
  
  // Declare random integer arrays for generating specific patterns
  rand int p[20], q[20], r[20];
  
  // Constraint for pattern 000100010001...
  // Every group of 4 bits: first 3 bits are 0, and the 4th bit is 1
  constraint c1 { 
    foreach (p[i]) 
      if (i % 4 < 3) 
        p[i] == 0; 
      else 
        p[i] == 1;
  }
  
  // Constraint for pattern 001100110011...
  // Every group of 4 bits: first 2 bits are 0, and the next 2 bits are 1
  constraint c2 { 
    foreach (q[i]) 
      if (i % 4 < 2) 
        q[i] == 0; 
      else 
        q[i] == 1;
  }
  
  // Constraint for pattern 112211221122...
  // Every group of 4 bits: first 2 bits are 1, and the next 2 bits are 2
  constraint c3 { 
    foreach (r[i]) 
      if (i % 4 < 2) 
        r[i] == 1; 
      else 
        r[i] == 2;
  }
  
  // Declare another random integer array for generating incremental patterns
  rand int a[20];
  
  // Constraint for pattern 00112233...
  // Every two consecutive elements are the same and increment every 2 indices
  constraint c4 { 
    foreach (a[i]) 
      a[i] == i / 2; 
  }
  
endclass

// Define the testbench module
module tb;
  initial begin
    // Create an object of the 'packet' class
    packet pk = new();
    
    // Randomize the object to generate values satisfying the constraints
    pk.randomize();
    
    // Display the generated patterns
    $display("===== Pattern 000100010001: %p", pk.p);
    $display("===== Pattern 001100110011: %p", pk.q);
    $display("===== Pattern 112211221122: %p", pk.r);
    $display("===== Pattern 00112233: %p", pk.a);
  end
endmodule
