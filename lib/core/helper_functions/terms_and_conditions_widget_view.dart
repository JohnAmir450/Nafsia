import 'package:flutter/material.dart';
import 'package:nafsia/core/utils/app_colors.dart';
import 'package:nafsia/core/utils/app_text_styles.dart';


void showTermsAndConditionsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: const Text(
          'الشروط والأحكام',
          style: TextStyles.bold23,
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSectionTitle('1. القبول بالشروط'),
              buildSectionContent(
                'باستخدامك لهذا التطبيق، فإنك توافق على الالتزام بهذه الشروط والأحكام. '
                'إذا كنت لا توافق على أي من هذه الشروط، يرجى التوقف عن استخدام التطبيق.',
              ),
              buildSectionTitle('2. معلومات عن الشركة'),
              buildSectionContent(
                'التطبيق تابع لـ الشركة العربية الخليجية، وهي شركة مصرية متخصصة في صناعة المواد الغذائية (الزيت والسمنة). '
                'الشركة قائمة في مصر ولديها شبكة توزيع في جميع أنحاء الشرق الأوسط.',
              ),
              buildSectionTitle('3. تسجيل المستخدم'),
              buildSectionContent(
                'للاستفادة من خدمات التطبيق، يتعين عليك تسجيل حساب باستخدام: الاسم الكامل، عنوان البريد الإلكتروني، رقم الهاتف، العنوان السكني. '
                'يمكنك أيضًا تسجيل الدخول باستخدام حساب Google أو Facebook الخاص بك.',
              ),
              // Add the new points and discount section here as number 4
              buildSectionTitle('4. جمع النقاط واستخدامها'),
              buildSectionContent(
                'عند شراء المنتجات من التطبيق، سيحصل المستخدم على نقاط وفقًا لقيمة المنتجات المشتراة. يمكن للمستخدم استخدام هذه النقاط للحصول على خصم على المشتريات المستقبلية. \n\n'
                '- **طريقة جمع النقاط**: يحصل المستخدم على 1 نقطة مقابل كل جنيه مصري يتم إنفاقه عند شراء المنتجات من التطبيق. \n'
                '- **طريقة استخدام النقاط**: يمكن للمستخدم استبدال النقاط للحصول على خصم على المشتريات المستقبلية، حيث يتم منح خصم قدره 20 جنيهًا مصريًا مقابل 1000 نقطة. \n\n'
                'الحد الأدنى للاستفادة من النقاط هو 1000 نقطة. \n\n'
                'يرجى ملاحظة أن النقاط لا يمكن استردادها نقدًا، وتظل سارية لفترة معينة وفقًا لسياسة الشركة. \n\n'
                'في حالة إلغاء الطلب، سيتم خصم النقاط التي تم اكتسابها من هذا الطلب من رصيدك.',
              ),
              buildSectionTitle('5. جمع البيانات واستخدامها'),
              buildSectionContent(
                'نقوم بجمع البيانات الشخصية لضمان تقديم الخدمات بشكل أفضل، مثل طلب المنتجات وتوصيلها. '
                'يتم التعامل مع جميع بياناتك الشخصية بسرية وفقًا لسياسة الخصوصية الخاصة بنا.',
              ),
              buildSectionTitle('6. استخدام التطبيق'),
              buildSectionContent(
                'يتيح التطبيق للمستخدمين الاطلاع على أحدث أسعار منتجات الشركة. '
                'يمكنك طلب المنتجات المتاحة والدفع عند استلام الطلب. '
                'يتيح التطبيق إمكانية متابعة حالة الطلبات المرسلة وتحديث بيانات الحساب الشخصي.',
              ),
              buildSectionTitle('7. الدفع عند الاستلام'),
              buildSectionContent(
                'الطريقة الوحيدة للدفع المتاحة حاليًا هي الدفع نقدًا عند استلام الطلب. '
                'يجب تقديم بيانات دقيقة وصحيحة لتسليم الطلب بنجاح.',
              ),
              buildSectionTitle('8. تحديث البيانات'),
              buildSectionContent(
                'يتحمل المستخدم مسؤولية تحديث بياناته الشخصية مثل العنوان ورقم الهاتف لضمان استلام الطلبات بشكل صحيح.',
              ),
              buildSectionTitle('9. إلغاء الطلبات'),
              buildSectionContent(
                'يحق للمستخدم إلغاء الطلب قبل تأكيده من قبل فريق العمل. '
                'في حالة الإلغاء بعد تأكيد الطلب، يحتفظ التطبيق بحق اتخاذ الإجراءات المناسبة.',
              ),
              buildSectionTitle('10. حقوق الملكية الفكرية'),
              buildSectionContent(
                'جميع المحتويات الموجودة في التطبيق، بما في ذلك النصوص والصور والشعارات، هي ملك للشركة العربية الخليجية ومحمية بموجب قوانين حقوق الملكية الفكرية. '
                'يحظر نسخ أو إعادة استخدام أي محتوى دون الحصول على إذن خطي مسبق من الشركة.',
              ),
              buildSectionTitle('11. حدود المسؤولية'),
              buildSectionContent(
                'يتم توفير التطبيق والخدمات كما هي، ولا تضمن الشركة أن التطبيق خالٍ من الأخطاء أو يعمل دون انقطاع. '
                'لا تتحمل الشركة أي مسؤولية عن أي أضرار ناتجة عن استخدام التطبيق أو الاعتماد على محتوياته.',
              ),
              buildSectionTitle('12. التعديلات على الشروط والأحكام'),
              buildSectionContent(
                'تحتفظ الشركة بالحق في تعديل هذه الشروط والأحكام في أي وقت. '
                'سيتم إخطار المستخدمين بأي تغييرات عن طريق تحديث تاريخ السريان في أعلى هذه الصفحة. '
                'يعتبر استمرار استخدامك للتطبيق بعد إجراء التعديلات موافقة منك على الشروط المعدلة.',
              ),
              buildSectionTitle('13. القوانين المعمول بها'),
              buildSectionContent(
                'تخضع هذه الشروط والأحكام وتفسر وفقًا للقوانين السارية في جمهورية مصر العربية. '
                'وأي نزاع ينشأ عنها يتم حله في المحاكم المصرية.',
              ),
              buildSectionTitle('14. بيانات التواصل'),
              buildSectionContent(
                'لأي استفسارات أو شكاوى، يرجى التواصل معنا عبر:\n'
                 '- الهاتف:\n 01140550072 \n 01028607331\n  0196817723\n'
                '- البريد الإلكتروني:\n  Gulf-arabian2015@outlook.com \n gulfarabiancompany650@gmail.com\n'
                '- العنوان: قطعة رقم 5 - المنطقة الصناعية - مدينة بدر',
              ),
            ],
          ),
        ),
        actions: [
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'موافق',
                textAlign: TextAlign.start,
                style: TextStyle(color: AppColors.primaryColor),
              ),
            ),
          ),
        ],
      );
    },
  );
}

Widget buildSectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
    child: Text(
      title,
      style: TextStyles.bold16.copyWith(color: AppColors.primaryColor),
    ),
  );
}

Widget buildSectionContent(String content) {
  return Text(
    content,
    style: TextStyles.semiBold13,
    textAlign: TextAlign.justify,
  );
}
