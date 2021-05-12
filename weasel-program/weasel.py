import random
import string 


possible_letters = string.ascii_uppercase + ' '
target_generation = 'METHINKS IT IS LIKE A WEASEL'


def get_similarity(generation: str) -> int:
    similarity = 0

    for index, letter in enumerate(generation):
        if letter == target_generation[index]: similarity += 1

    return similarity


def mutate(generation: str) -> str:
    chance = 5
    mutation = ''

    for index, letter in enumerate(generation):
        if letter != target_generation[index] and random.randint(1, 100) <= chance:
            mutation += random.choice(possible_letters)
        else:
            mutation += letter

    return mutation


def simulate(current_generation: str) -> str:
    max_similarity = -1
    next_generation = ''

    generation_copies = [current_generation] * 100

    for copy in generation_copies:
        mutation = mutate(copy)

        similarity = get_similarity(mutation)

        if similarity > max_similarity:
            next_generation = mutation
            max_similarity = similarity

    return next_generation


def show_generation(generation: str, generation_number: int) -> None:
    print(f'Generation {repr(generation_number).zfill(2)}:   {generation}')


if __name__ == '__main__':
    current_generation = ''.join(random.choices(possible_letters, k = len(target_generation)))

    i = 1
    while get_similarity(current_generation) != 28:
        show_generation(current_generation, i)

        current_generation = simulate(current_generation)

        i += 1
    else:
        show_generation(current_generation, i)
