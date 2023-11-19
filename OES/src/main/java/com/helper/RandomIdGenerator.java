package com.helper;

import java.util.Random;

public class RandomIdGenerator {
	private static final String CHAR_LIST = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
	private static final int RANDOM_STRING_LENGTH = 10;
	private static final Random random = new Random();

	public static String generateRandomString() {
		StringBuilder randomString = new StringBuilder();
		for (int i = 0; i < RANDOM_STRING_LENGTH; i++) {
			int number = getRandomNumber();
			char ch = CHAR_LIST.charAt(number);
			randomString.append(ch);
		}
		return randomString.toString();
	}

	private static int getRandomNumber() {
		int randomInt = 0;
		randomInt = random.nextInt(CHAR_LIST.length());
		if (randomInt - 1 == -1) {
			return randomInt;
		} else {
			return randomInt - 1;
		}
	}

	public static void main(String[] args) {
		System.out.println("Random Identifier: " + generateRandomString());
	}
}