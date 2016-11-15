#include<iostream.h>
#include"TObject.h"

class Sclass:public TObject{
  private:
    Float_h  fX;
    Float_h  fY;
  public:
    Sclass()       { fX = fY = 0; }
    void Print() const;
    void SetX(float x)   { fX=x; }
    void SetY(float y)   { fY=y; }
    
ClassDef(Sclass,1)
};
