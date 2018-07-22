
#include<iostream>
#include <stdio.h>
#include<podofo/podofo.h>
#include<string.h>
#include<fstream>

using namespace PoDoFo;
using namespace std;


int main(int argc, char* argv[] ){

	PdfMemDocument pdf(argv[1]);
	const PdfObject * const trailerRoot = pdf.GetTrailer();
	const PdfObject * const catalogRef = trailerRoot->GetDictionary().GetKey(PdfName("Root"));
	const PdfObject * const catalog = pdf.GetObjects().GetObject(catalogRef->GetReference());
	const PdfObject * acrom = catalog->GetDictionary().GetKey(PdfName("AcroForm"));
	const PdfObject * fieldsValue = acrom->GetDictionary().GetKey(PdfName("Fields"));
	
	const PdfArray &array =fieldsValue->GetArray();

	string filterString;

	for(int i= 0 ; i<array.size();i++){
		const PdfObject * const obj = pdf.GetObjects().GetObject(array[i].GetReference());
		const PdfObject * const V = obj->GetDictionary().GetKey(PdfName("V"));
		const PdfObject * const signature = pdf.GetObjects().GetObject(V->GetReference());
		const PdfObject * const filter = signature->GetDictionary().GetKey(PdfName("Filter"));
		const PdfObject * const subFilter = signature->GetDictionary().GetKey(PdfName("SubFilter"));
		const PdfObject * const content = signature->GetDictionary().GetKey(PdfName("Contents"));
		

		
		content->ToString(contentsString);

	}

	ofstream outfile("asn1_from_pdf.txt");
	outfile << contentsString;

	outfile.close();
	return 0;
}
