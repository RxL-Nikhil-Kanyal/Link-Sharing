enum Visibility {
    Public(0), Private(1)

    Visibility(int value) {
        this.value = value
    }
    private final int value

    int getValue() {
        value
    }
}