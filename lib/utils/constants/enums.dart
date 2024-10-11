/* --
      LIST OF Enums
      They cannot be created inside a class.
-- */

import 'package:tergov/common/widgets/images/t_rounded_image.dart';

/// [ImageType] is used in [TRoundedImage]
enum ImageType { network, asset, file, memory }

/// [YesNo] is used in [TInfoFormFirstModel]
enum YesNo { yes, no }

enum AdminType {
  simpleAdmin("simple_admin", 'Simple Admin'),
  superAdmin("super_admin", 'Super Admin');

  const AdminType(this.roleName, this.name);

  final String roleName;
  final String name;
}
