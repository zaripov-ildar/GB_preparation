package ru.gb.preparation.hw_5;

public enum Mark {
    A, B, C, D, E, F;

    public static Mark getRandomMark() {
        int num = (int) (Math.random() * values().length);
        return values()[num];
    }
}
