#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

char alphabet[28] = " ABCDEFGHIJKLMNOPQRSTUVWXYZ";
char targetGeneration[28] = "METHINKS IT IS LIKE A WEASEL";

char chooseRandomLetterFromAlphabet() {
    return alphabet[rand() % 28];
}

void printGeneration(char *generation, int currentGeneration){
    printf("Generation %d: ", currentGeneration);
    for(int i = 0; i < 28; i++){
        printf("%c", generation[i]);
    }
    printf("\n");
}

int getSimilarity(char currentGeneration[]) {
  int similarity = 0;

  for(int i = 0; i < 28; i++) {
    if (currentGeneration[i] == targetGeneration[i]) {
      similarity++;
    }
  }

  return similarity;
}

int main() {
    char currentGeneration[28];
    char generation_copies[100][28];
    int max_points = 0;
    int actual_points = 0;
    int generations_count = 1;

    srand(time(NULL));

    for(int i = 0; i < 28; i++){
        currentGeneration[i] = chooseRandomLetterFromAlphabet();
    }

    while(max_points != 28) {
        for(int i = 0; i < 100; i++) {
            for(int j = 0; j < 28; j++) {
                generation_copies[i][j] = currentGeneration[j];
            }
        }

        for(int i = 0; i < 100; i++) {
            for(int j = 0; j < 28; j++) {
                if(rand() % 100 < 5){
                    generation_copies[i][j] = chooseRandomLetterFromAlphabet();
                }
            }
        }

        for(int i = 0; i < 100; i++) {
            actual_points = getSimilarity(generation_copies[i]);
            if(actual_points > max_points) {
                max_points = actual_points;
                for(int j = 0; j < 28; j++) {
                    currentGeneration[j] = generation_copies[i][j];
                }
            }
        }

        printGeneration(currentGeneration, generations_count);
        generations_count++;
    }

    printf("Total generations needed: %d\n", generations_count);
    return 0;
}
