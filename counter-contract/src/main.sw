// Every Sway file must start with a declaration of what type of program the file contains; here, we've declared that this file is a contract.

contract;

// Next, we'll define a storage value. In our case, we have a single counter that we'll call counter of type 64-bit unsigned integer and initialize it to 0.

storage {
    counter: u64 = 0,
}

// An ABI defines an interface, and there is no function body in the ABI. A contract must either define or import an ABI declaration and implement it. It is considered best practice to define your ABI in a separate library and import it into your contract because this allows callers of the contract to import and use the ABI in scripts to call your contract.

// For simplicity, we will define the ABI directly in the contract file.

abi Counter {
   
    #[storage(read, write)]
    //  is an annotation which denotes that this function has permission to read and write values in
    // storage.

    fn increment();
    // We're introducing the functionality to increment and denoting it shouldn't return any value.

    #[storage(read)]
    fn count() -> u64;
}


// Below your ABI definition, you will write the implementation of the functions defined in your ABI.

impl Counter for Contract {
    #[storage(read)]
    // we read and return the variable counter from storage.
    fn count() -> u64 {
        storage.counter
    }

    // we read the variable counter from storage and increment its value by one. We then store the new value back in counter
    #[storage(read, write)]
    fn increment() {
        storage.counter = storage.counter + 1;
    }

}
