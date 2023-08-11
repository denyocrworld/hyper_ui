import 'package:faker_dart/faker_dart.dart';

extension RandomImageExtension on Faker {
  generateRandomImage() {
    List images = [
      "https://i.ibb.co/n8m5gq5/photo-1521305916504-4a1121188589-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "https://i.ibb.co/VNv5ssY/photo-1530554764233-e79e16c91d08-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "https://i.ibb.co/2svBkJt/photo-1541544741938-0af808871cc0-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "https://i.ibb.co/6sq1fN3/photo-1508737027454-e6454ef45afd-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "https://i.ibb.co/YRs4cjb/photo-1460306855393-0410f61241c7-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "https://i.ibb.co/D5c7LmB/photo-1461023058943-07fcbe16d735-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "https://i.ibb.co/vZYZyrx/photo-1517487881594-2787fef5ebf7-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "https://i.ibb.co/pJnCfXW/photo-1506619216599-9d16d0903dfd-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "https://i.ibb.co/n6HKyHT/photo-1494314671902-399b18174975-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "https://i.ibb.co/3dFs80H/photo-1521401292936-0a2129a30b1c-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "https://i.ibb.co/Ht7X0Bg/photo-1503508343067-c4103b7140b3-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "https://i.ibb.co/NCMwWCq/photo-1605716795075-d035e4f624d6-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "https://i.ibb.co/HPZQHFd/photo-1547514701-42782101795e-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-HNl.jpg",
      "https://i.ibb.co/wcFPr2M/photo-1540331547168-8b63109225b7-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "https://i.ibb.co/jh7Xv9h/photo-1557800634-7bf3c7305596-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-HNl.jpg",
      "https://i.ibb.co/dQ41JJC/photo-1436262513933-a0b06755c784-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "https://i.ibb.co/WBSTRHM/photo-1592152045578-7aa07f0d1bcd-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "https://i.ibb.co/R2cY4w6/Qo-R8-Bv1-S2-SEq-H6-Uc-SJCA-Tea-jpg-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwx.jpg",
      "https://i.ibb.co/sQ1cgSW/photo-1605793375565-03bd8fb23cf7-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "https://i.ibb.co/thB8mNW/photo-1532136868905-8094ef8ef5f2-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
    ];
    images.shuffle();
    return images.first;
  }
}
