import java.util.Random;
public class Weasel {
    public static final String targetGeneration = "METHINKS IT IS LIKE A WEASEL";
    public static char[] possibleLetters = new char[27];

    public static final int PERFECT_SCORE = 28;

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

    public static String mutate(String generation) {
        final int CHANCE = 5;
        String mutation = "";

        for(int i = 0; i < generation.length(); i++) {
            if(generation.charAt(i) != targetGeneration.charAt(i)) {
                int number = new Random().nextInt(100);

                mutation += (number < CHANCE) ? chooseRandomLetterFrom(possibleLetters) : generation.charAt(i);
            }
            else {
                mutation += generation.charAt(i);
            }
        }

        return mutation;
    }

    public static String simulate(String currentGeneration) {
        String nextGeneration = "";
        int maxSimilarity = -1;

        String[] generationCopies = new String[100];

        for(int i = 0; i < 100; i++) {
            generationCopies[i] = currentGeneration;
        }

        for(String copy : generationCopies) {
            String mutation = mutate(copy);

            int similarity = getSimilarity(mutation);

            if(similarity > maxSimilarity) {
                nextGeneration = mutation;
                maxSimilarity = similarity;
            }
        }
    
        return nextGeneration;
    }

    public static void displayGeneration(String generation, int generationNumber) {
        System.out.printf("Generation %02d:   %s\n", generationNumber, generation);
    }

    public static void main(String[] args) {
        init();

        String currentGeneration = createInitialGeneration();

        int generationNumber = 1;
        while(getSimilarity(currentGeneration) != PERFECT_SCORE) {
            displayGeneration(currentGeneration, generationNumber);

            currentGeneration = simulate(currentGeneration);

            generationNumber++;
        }

        displayGeneration(currentGeneration, ++generationNumber);
    }
}
