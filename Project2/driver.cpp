#include <iostream>
#include "BSTree.h"
#include "DLList.h"

using namespace std;

int main()
{
	try {

		DLList<char> *L1 = new DLList<char>();
		//BSTree<LLNode<char>> *T1 = new BSTree<LLNode<char>>();

		L1->insert('b');
		for(int i = 0 ; i < 4; i++)
		L1->insert('x');
		for (int i = 0; i < 2; i++)
		L1->insert('f');
		for (int i = 0; i < 10; i++)
		L1->insert('d');

		//L1->remove('d');
		//L1->remove('b');
		//L1->remove('f');
		//L1->remove('x');

		L1->print();

		L1->quicksort();

		L1->print();
		/*
		

		t1->add(11);

		cout << "Post order: ";
		t1->print(3);
		*/
	}
	catch (exception const &ex)
	{
		cerr << "Exception: " << ex.what() << endl;
	}

	cout << endl;

	system("pause");
	return 0;
}