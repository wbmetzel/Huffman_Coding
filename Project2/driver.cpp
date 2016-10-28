#include <iostream>
#include "BSTree.h"
#include "DLList.h"

using namespace std;

int main()
{
	try {

		DLList<char> *L1 = new DLList<char>();

		L1->insert('b');
		L1->insert('x');
		L1->insert('f');
		L1->insert('b');
		L1->insert('d');
		L1->print();

		/*
		BSTree<int> *t1 = new BSTree<int>();

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