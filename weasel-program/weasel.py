import random
import string 
import time


possible_letters = string.ascii_uppercase + ' '


def get_similarity(next_generation: str, target_generation) -> int:
    similarity = 0

    for index, letter in enumerate(next_generation):
        if letter == target_generation[index]: similarity += 1

    return similarity


def generate_next_generation(current_generation: str, target_generation: str) -> str:
    chance = 5
    next_generation = ''

    for index, letter in enumerate(current_generation):
        next_generation += random.choice(possible_letters) if letter != target_generation[index] and random.randint(1, 100) < chance else letter

    return next_generation


def simulate(current_generation: str, target_generation: str) -> str:
    max_similarity = -1
    next_generation = ''

    for i in range(100):
        candidate = generate_next_generation(current_generation, target_generation)

        similarity = get_similarity(candidate, target_generation)

        if similarity > max_similarity:
            next_generation = candidate
            max_similarity = similarity

    return next_generation


def show_generation(generation: str, generation_number: int) -> None:
    print(f'Generation {repr(generation_number).zfill(2)}:   {generation}')


if __name__ == '__main__':
    target_generation = 'METHINKS IT IS LIKE A WEASEL'
    current_generation = ''.join(random.choices(possible_letters, k = len(target_generation)))

    i = 0
    while current_generation != target_generation:
        show_generation(current_generation, i)

        current_generation = simulate(current_generation, target_generation)

        i += 1
    else:
        show_generation(current_generation, i)
