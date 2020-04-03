enum Seriousness {
    Serious(0), Very_Serious(1), Casual(2)

    Seriousness(int value) {
        this.value = value
    }
    private final int value

    int getValue() {
        value
    }

}