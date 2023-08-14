script; 

// returns 3
fn constants() -> u256 {
    0x0000000000000000000000000000000000000000000000000000000000000001u256 + 0x0000000000000000000000000000000000000000000000000000000000000002u256
}

// returns 1
fn locals() -> u256 {
    let a = 0x0000000000000000000000000000000000000000000000000000000000000005u256;
    let b = 0x0000000000000000000000000000000000000000000000000000000000000004u256;
    let c = 0x0000000000000000000000000000000000000000000000000000000000000001u256;
    let d = 0x0000000000000000000000000000000000000000000000000000000000000004u256;
    let e = 0x0000000000000000000000000000000000000000000000000000000000000002u256;
    
    let result = ((a + b - c) * d / e) % a;
    assert(result == 0x0000000000000000000000000000000000000000000000000000000000000001u256);

    result
}

// returns 9
fn bitwise_operators() -> u256 {
    let a = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFu256;
    let b = 0x0000000000000000000000000000000000000000000000000000000000000003u256;
    let c = 0x0000000000000000000000000000000000000000000000000000000000000002u256;
    let d = 0x0000000000000000000000000000000000000000000000000000000000000004u256;
    let e = 0x000000000000000000000000000000000000000000000000000000000000000Fu256;
    !(a - b) & c | d ^ e
}

// returns 8
fn shift_operators() -> u256 {
    // assert u256 shifts behave like u64 shifts
    let a = 0b10;
    assert(a >> 1 == 1);
    assert(a >> 2 == 0);
    assert(a >> 3 == 0);

    let a = 0b1000000000000000000000000000000000000000000000000000000000000000;
    assert(a >> 1 == 0b0100000000000000000000000000000000000000000000000000000000000000);

    let a = 0b0100000000000000000000000000000000000000000000000000000000000000;
    assert(a << 1 == 0b1000000000000000000000000000000000000000000000000000000000000000);
    assert(a << 2 == 0);
    assert(a << 3 == 0);

    assert(0b0000000000000000000000000000000000000000000000000000000000000001 << 63 == 0b1000000000000000000000000000000000000000000000000000000000000000);
    assert(0b1000000000000000000000000000000000000000000000000000000000000000 >> 63 == 0b0000000000000000000000000000000000000000000000000000000000000001);

    // now u256
    let a = 0x0000000000000000000000000000000000000000000000000000000000000002u256;
    assert(a >> 1 == 0x0000000000000000000000000000000000000000000000000000000000000001u256);
    assert(a >> 2 == 0x0000000000000000000000000000000000000000000000000000000000000000u256);
    assert(a >> 3 == 0x0000000000000000000000000000000000000000000000000000000000000000u256);
    let a = 0x8000000000000000000000000000000000000000000000000000000000000000u256;
    assert(a >> 1 == 0x4000000000000000000000000000000000000000000000000000000000000000u256);

    let a = 0x4000000000000000000000000000000000000000000000000000000000000000u256;
    assert(a << 1 == 0x8000000000000000000000000000000000000000000000000000000000000000u256);
    assert(a << 2 == 0x0000000000000000000000000000000000000000000000000000000000000000u256);
    assert(a << 3 == 0x0000000000000000000000000000000000000000000000000000000000000000u256);

    assert(0x0000000000000000000000000000000000000000000000000000000000000001u256 << 255 == 0x8000000000000000000000000000000000000000000000000000000000000000u256);
    assert(0x8000000000000000000000000000000000000000000000000000000000000000u256 >> 255 == 0x0000000000000000000000000000000000000000000000000000000000000001u256);

    // return some value
    let a = 0x0000000000000000000000000000000000000000000000000000000000000002u256;
    (a << 4) >> 2
}


// returns 0
fn comparison_operators() -> u256 {
    let a = 0x0000000000000000000000000000000000000000000000000000000000000001u256;
    let b = 0x0000000000000000000000000000000000000000000000000000000000000002u256;
    let c = 0x0000000000000000000000000000000000000000000000000000000000000003u256;
    let d = 0x0000000000000000000000000000000000000000000000000000000000000003u256;
    
    assert(c == c);
    assert(c <= c);
    assert(c >= c);

    assert(c == d);
    assert(d == c);
    assert(c <= d);
    assert(c >= d);
    assert(d <= c);
    assert(d >= c);

    assert(a < b);
    assert(b < c);
    assert(a < c);

    assert(a <= b);
    assert(b <= c);
    assert(a <= c);

    assert(b > a);
    assert(c > b);
    assert(c > a);

    return 0x0000000000000000000000000000000000000000000000000000000000000000u256;
}

fn main() -> u256 {
    constants() + locals() + bitwise_operators() + shift_operators() + comparison_operators()
}