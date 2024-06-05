#include <stdlib.h>
#include <stdio.h>

int* minmax(char input[]);

int main(){
	char input[] = "11 33 22 44 55 65 74 83 93 18\n";
	int* mm = minmax(input);
	printf("%d\n",mm[0]);
	printf("%d\n",mm[1]);
	return 0;

}

int* minmax(char input[]){
	int* arr = (int*)malloc(sizeof(int)*2);
	int max = -1;
	int min = -1;
	
	int i = 0;

	while (i < 27){
		char c1 = input[i];
		char c2 = input[i+1];
		int ac1 = c1 - '0';
		int ac2 = c2 - '0';
		int combine = (ac1*10) + ac2;

		if (max == -1){
			max = combine;
			min = combine;
		}

		if (max < combine){
			max = combine;
		}

		if (min > combine){
			min = combine;
		}

		i = i + 3;
	}

	arr[0] = min;
	arr[1] = max;


	return arr;


}