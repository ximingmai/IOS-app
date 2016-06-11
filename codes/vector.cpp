#include <vector>
#include <iostream>
using namespace std;
struct node {
	int t;
	int y;
};
int test() {
	int t = 100;
	t += 100;
	return t;
}
int main() {
	int t = 0;
	node y;
	for (int i = 0; i < 10000; ++i)
	{
		t++;
	}
	cout << "end" << endl;
	return 0;
}
