// ============================= Prime Address Sequence Item ====================== //
// Here we Create Sequence item for Prime addresss which is extended from APB sequence Item . This Class contain constraint and all function required to find prime address.
class prime_seq_item extends apb_seq_item;
    `uvm_object_utils(prime_seq_item)
    bit [31:0] num;
    bit [31:0] array_q[$]; // Queue To store Prime address location 
    function  new(string name = "prime_seq_item");
        super.new(name);
    endfunction

     constraint prime_address_c
     {
        //  THis is constrint  to check weather address is inside queue
        PWRITE == 1;
        foreach(PADDR[i])
        {

            PADDR[i] inside {array_q};
        }
     }
    // IN this function we Check weather the given Address is prime or not if it is prime function will return 1 if not it will return 0
    function int check_prime(bit [31:0] n);
        if (n == 0 || n == 1) begin
            return 0;
        end
        for (int i=2; i < n; i++)begin
            if (n % i == 0 ) begin
                return 0;
            end
        end
        return 1;
    endfunction
    // In this function we Push prime address in the queue 
    function void pre_randomize();
        for (int i=0; i<= 50; i++) begin
            num = $urandom_range(2 , 100);
            if (check_prime(num) == 1) begin
                array_q.push_back(num);
            end
        end
    endfunction
endclass