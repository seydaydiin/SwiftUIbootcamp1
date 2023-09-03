//
//  ViewModel.swift
//  Bootcamp
//
//  Created by Şeyda Aydın on 22.08.2023.
//
import SwiftUI

struct fruitModel : Identifiable {
    
    let id = UUID().uuidString
    let name : String
    let count : Int
}

class FruitViewModel : ObservableObject {
    @Published var fruits : [fruitModel] = []
    @Published var isLoading : Bool = false
    
    //View modelde veriler ile ilgili şeyler
    
 //Aynı şeyler ama bir sınıfın içerisindeyiz bu yüzden published kullandık. fruits arrayınde bir değişiklik olduğunda published sayesinde bu durum fruitViewModele duyurulur
    
    init() {
        getFruit()
    }
    
    func deleteFruit(indexSet : IndexSet) {
        
        fruits.remove(atOffsets: indexSet)
    }
    
    func getFruit() {
        
        let fruit1 = fruitModel(name: "Orange", count: 1)
        let fruit2 = fruitModel(name: "Banana", count: 2)
        let fruit3 = fruitModel(name: "Watermelon", count: 30)
        let fruit4 = fruitModel(name: "Apple", count: 6)
        
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.fruits.append(fruit1)
            self.fruits.append(fruit2)
            self.fruits.append(fruit3)
            self.fruits.append(fruit4)
            self.isLoading = false
            
        }
        
    }
}



struct ViewModel: View {
    
    @StateObject var fruitViewModel : FruitViewModel = FruitViewModel()
    
//View de kullanıcı arayüzü ile ilgili şeyler
    
    /*burada düzenli değişkenler oluşturduğumuz gibi durum eklediğimizde , görünüme bunun değişebileceğini ve değiştiğinde de görünümü güncellememiz gerektiğini söylemek için bu viewModel değişkenine bir özellik eklenir.FruitViewModeli gözlemlemesi isteniyoyor.Bu yüzden viewModeli de @ObservableObject yapıyoruz
    */
    //@State var fruits : [fruitModel] = []    //State görünümdeyken
    
    
    //View oldu da yeniden yüklenmesi gerekti @ObservedObject gözlemlenen objeyi yani viewModeli de yeniliyor . Halbuki veri seti değişmiyor biz de bunun önüne geçebilmek için @StateObject kullanacağız. Bu @ObservedObject ile aynı şeydir.Ancak tek farklı görünüm yenilenirse gözlemlenen nesne olan fruitViewModel kalıcı oluyor ve yenilenmiyor.
    
    // Nesne türü uygulamamızı açtığımız ilk viewdeyse @StateObject eğer  alt veya ikinci  viewlere aktarıyorsak @ObservedObject
    
    //StateObject : Use this creatıon ınıt
    //ObservedObject : Use this for subview
    
    var body: some View {
        NavigationView {
            
            List {
                
                if fruitViewModel.isLoading {
                    ProgressView()
                }
                else {
                    ForEach(fruitViewModel.fruits) { fruit in
                        
                        HStack{
                            
                            Text("\(fruit.count)")
                                .foregroundColor(.red)
                            Text(fruit.name)
                                .font(.headline)
                                .bold()
                            
                        }
                    }
                    
                    .onDelete(perform: fruitViewModel.deleteFruit)
                }
                    
                }
            .navigationBarItems(trailing:
                                    NavigationLink(destination: SecondView(fruitViewModel: fruitViewModel),
                                                   label: {
                                        Image(systemName: "arrow.right")
                                        .font(.title) })
                                   
            )
            .navigationTitle("Fruit List")
          
            
        }
    }
}

struct SecondView : View {
    @ObservedObject var fruitViewModel : FruitViewModel
    
    var body : some View {
        
        ZStack {
            
            Color.pink.ignoresSafeArea()
            
            VStack {
               
                ForEach(fruitViewModel.fruits) {  fruit in
                    Text(fruit.name)
                        .foregroundColor(.white)
                        .font(.headline)
                }
                
                
            }
            
            
        }
        
        
        
    }
}
    
    struct ViewModel_Previews: PreviewProvider {
        static var previews: some View {
            ViewModel()
        }
    }

