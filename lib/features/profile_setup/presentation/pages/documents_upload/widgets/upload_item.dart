import 'package:flutter/material.dart';
import 'package:pander/core/constants/app_styles.dart';

class UploadItemWidget extends StatelessWidget {
  final String filename;
  final Function onDelete;
  final Function onViewImage;

  const UploadItemWidget({Key key, this.filename, this.onDelete, this.onViewImage}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onViewImage,
      child: PhysicalModel(
        elevation: 4,
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
              children: [
                Icon(
                  Icons.file_present,
                  color: Colors.grey
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    filename,
                    style: AppStyles.textSMBlack,
                  ),
                ),
                SizedBox(width: 12),
                IconButton(
                  icon: Icon(Icons.delete_forever_outlined),
                  onPressed: onDelete,
                  color: Colors.redAccent,
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}