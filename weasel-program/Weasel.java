import java.util.Random;
public class Weasel {
    public static final String targetGeneration = "METHINKS IT IS LIKE A WEASEL";
    public static char[] possibleLetters = new char[27];

    public static void init() {
        for(int i = 65; i < 91; i++) {
            possibleLetters[i - 65] = (char) i;
        }

        possibleLetters[26] = ' ';
    }

    public static char chooseRandomLetterFrom(char[] array) {
        int length = array.length;
        int index = new Random().nextInt(length);
        return array[index];
    }

    public static String createInitialGeneration() {
        String initialGeneration = "";

        for(int i = 0; i < targetGeneration.length(); i++) {
            initialGeneration += chooseRandomLetterFrom(possibleLetters);
        }

        return initialGeneration;
    }

    public static int getSimilarity(String generation) {
        int similarity = 0;

        for(int i = 0; i < targetGeneration.length(); i++) {
            if(generation.charAt(i) == targetGeneration.charAt(i)) similarity++;
        }

        return similarity;
    }

    public static String generateNextGeneration(String currentGeneration) {
        final int CHANCE = 5;
        String nextGeneration = "";

        for(int i = 0; i < currentGeneration.length(); i++) {
            int number = new Random().nextInt(100);
            nextGeneration += (number < CHANCE) ? chooseRandomLetterFrom(possibleLetters) : currentGeneration.charAt(i);
        }

        return nextGeneration;
    }

    public static String simulate(String currentGeneration) {
        String nextGeneration = "";
        int maxSimilarity = -1;

        for(int i = 0; i < 100; i++) {
            String candidate = generateNextGeneration(currentGeneration);

            int similarity = getSimilarity(candidate);

            if(similarity > maxSimilarity) {
                nextGeneration = candidate;
                maxSimilarity = similarity;
            }
        }
    
        return nextGeneration;
    }

    public static void displayGeneration(String generation, int generationNumber) {
        System.out.println("Generation " + Integer.toString(generationNumber) + ":   " + generation);
    }

    public static void main(String[] args) {
        init();

        String currentGeneration = createInitialGeneration();

        int generationNumber = 1;
        while(!targetGeneration.equals(currentGeneration)) {
            displayGeneration(currentGeneration, generationNumber);

            currentGeneration = simulate(currentGeneration);

            generationNumber++;
        }

        displayGeneration(currentGeneration, ++generationNumber);
    }
}
