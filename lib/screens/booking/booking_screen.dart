import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../config/site_config.dart';
import '../../core/constants/app_colors.dart';
import '../../core/utils/url_utils.dart';
import '../../widgets/common/content_width.dart';
import '../../widgets/common/page_header.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _phone = TextEditingController();
  final _email = TextEditingController();
  final _area = TextEditingController();
  final _concern = TextEditingController();
  final _date = TextEditingController();
  final _time = TextEditingController();
  final _notes = TextEditingController();
  String? _type;
  bool _consent = false;
  bool _consentError = false;

  @override
  void dispose() {
    for (final controller in [
      _name,
      _phone,
      _email,
      _area,
      _concern,
      _date,
      _time,
      _notes,
    ]) {
      controller.dispose();
    }
    super.dispose();
  }

  String? _required(String? value) =>
      value == null || value.trim().isEmpty ? 'This field is required' : null;

  Future<void> _pickDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (date != null) {
      _date.text =
          '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
    }
  }

  Future<void> _pickTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 10, minute: 0),
    );
    if (time != null && mounted) _time.text = time.format(context);
  }

  void _submit() {
    final valid = _formKey.currentState!.validate();
    setState(() => _consentError = !_consent);
    if (!valid || !_consent) return;

    final message =
        '''
Hello, I would like to book a physiotherapy appointment.

Name: ${_name.text.trim()}
Phone: ${_phone.text.trim()}
Consultation Type: $_type
Area: ${_area.text.trim()}
Main Concern: ${_concern.text.trim()}
Preferred Date: ${_date.text.trim()}
Preferred Time: ${_time.text.trim()}
Notes: ${_notes.text.trim().isEmpty ? 'None' : _notes.text.trim()}

Please let me know about availability.''';
    UrlUtils.whatsapp(message);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PageHeader(
          eyebrow: 'Book an appointment',
          title: 'Tell me how I can support you',
          description:
              'Complete the form and your details will be prepared as a WhatsApp message. No information is stored by this website.',
        ),
        ContentWidth(
          maxWidth: 1040,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 76),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final desktop = constraints.maxWidth > 780;
                final form = _BookingForm(
                  formKey: _formKey,
                  name: _name,
                  phone: _phone,
                  email: _email,
                  area: _area,
                  concern: _concern,
                  date: _date,
                  time: _time,
                  notes: _notes,
                  type: _type,
                  consent: _consent,
                  consentError: _consentError,
                  requiredValidator: _required,
                  onTypeChanged: (value) => setState(() => _type = value),
                  onConsentChanged: (value) =>
                      setState(() => _consent = value ?? false),
                  onPickDate: _pickDate,
                  onPickTime: _pickTime,
                  onSubmit: _submit,
                );
                const aside = _BookingAside();
                return desktop
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(flex: 7, child: form),
                          const SizedBox(width: 36),
                          const Expanded(flex: 4, child: aside),
                        ],
                      )
                    : Column(
                        children: [form, const SizedBox(height: 30), aside],
                      );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _BookingForm extends StatelessWidget {
  const _BookingForm({
    required this.formKey,
    required this.name,
    required this.phone,
    required this.email,
    required this.area,
    required this.concern,
    required this.date,
    required this.time,
    required this.notes,
    required this.type,
    required this.consent,
    required this.consentError,
    required this.requiredValidator,
    required this.onTypeChanged,
    required this.onConsentChanged,
    required this.onPickDate,
    required this.onPickTime,
    required this.onSubmit,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController name;
  final TextEditingController phone;
  final TextEditingController email;
  final TextEditingController area;
  final TextEditingController concern;
  final TextEditingController date;
  final TextEditingController time;
  final TextEditingController notes;
  final String? type;
  final bool consent;
  final bool consentError;
  final String? Function(String?) requiredValidator;
  final ValueChanged<String?> onTypeChanged;
  final ValueChanged<bool?> onConsentChanged;
  final VoidCallback onPickDate;
  final VoidCallback onPickTime;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(MediaQuery.sizeOf(context).width < 500 ? 20 : 32),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.border),
      ),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Appointment details',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 26),
            _Field(
              controller: name,
              label: 'Full name',
              validator: requiredValidator,
              autofillHints: const [AutofillHints.name],
            ),
            const SizedBox(height: 16),
            _Field(
              controller: phone,
              label: 'WhatsApp number',
              validator: requiredValidator,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9+\-\s]')),
              ],
              autofillHints: const [AutofillHints.telephoneNumber],
            ),
            const SizedBox(height: 16),
            _Field(
              controller: email,
              label: 'Email (optional)',
              keyboardType: TextInputType.emailAddress,
              autofillHints: const [AutofillHints.email],
              validator: (value) {
                if (value != null && value.isNotEmpty && !value.contains('@')) {
                  return 'Enter a valid email address';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              initialValue: type,
              decoration: const InputDecoration(labelText: 'Consultation type'),
              items: SiteConfig.consultationOptions
                  .map(
                    (item) => DropdownMenuItem(value: item, child: Text(item)),
                  )
                  .toList(),
              onChanged: onTypeChanged,
              validator: requiredValidator,
            ),
            const SizedBox(height: 16),
            _Field(
              controller: area,
              label: 'Area / location',
              validator: requiredValidator,
            ),
            const SizedBox(height: 16),
            _Field(
              controller: concern,
              label: 'Main concern',
              validator: requiredValidator,
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            LayoutBuilder(
              builder: (context, constraints) {
                final compact = constraints.maxWidth < 520;
                final dateField = _Field(
                  controller: date,
                  label: 'Preferred date',
                  validator: requiredValidator,
                  readOnly: true,
                  onTap: onPickDate,
                  suffixIcon: const Icon(Icons.calendar_today_rounded),
                );
                final timeField = _Field(
                  controller: time,
                  label: 'Preferred time',
                  validator: requiredValidator,
                  readOnly: true,
                  onTap: onPickTime,
                  suffixIcon: const Icon(Icons.schedule_rounded),
                );
                return compact
                    ? Column(
                        children: [
                          dateField,
                          const SizedBox(height: 16),
                          timeField,
                        ],
                      )
                    : Row(
                        children: [
                          Expanded(child: dateField),
                          const SizedBox(width: 16),
                          Expanded(child: timeField),
                        ],
                      );
              },
            ),
            const SizedBox(height: 16),
            _Field(
              controller: notes,
              label: 'Additional notes (optional)',
              maxLines: 4,
            ),
            const SizedBox(height: 12),
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              value: consent,
              onChanged: onConsentChanged,
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(
                'I consent to sending these details through WhatsApp to request an appointment.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              subtitle: consentError
                  ? const Text(
                      'Consent is required',
                      style: TextStyle(color: Colors.red),
                    )
                  : null,
            ),
            const SizedBox(height: 18),
            ElevatedButton.icon(
              onPressed: onSubmit,
              icon: const Icon(Icons.chat_bubble_rounded),
              label: const Text('Continue to WhatsApp'),
            ),
          ],
        ),
      ),
    );
  }
}

class _Field extends StatelessWidget {
  const _Field({
    required this.controller,
    required this.label,
    this.validator,
    this.keyboardType,
    this.inputFormatters,
    this.autofillHints,
    this.maxLines = 1,
    this.readOnly = false,
    this.onTap,
    this.suffixIcon,
  });

  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Iterable<String>? autofillHints;
  final int maxLines;
  final bool readOnly;
  final VoidCallback? onTap;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: label, suffixIcon: suffixIcon),
      validator: validator,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      autofillHints: autofillHints,
      maxLines: maxLines,
      readOnly: readOnly,
      onTap: onTap,
    );
  }
}

class _BookingAside extends StatelessWidget {
  const _BookingAside();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColors.forest,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'What happens next?',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: AppColors.white,
              fontSize: 28,
            ),
          ),
          const SizedBox(height: 22),
          const _AsideStep('1', 'Your details open in WhatsApp.'),
          const _AsideStep('2', 'Review the message before sending.'),
          const _AsideStep('3', 'Availability is confirmed in conversation.'),
          const SizedBox(height: 12),
          Divider(color: AppColors.white.withValues(alpha: .22)),
          const SizedBox(height: 16),
          Text(
            'Clinic hours',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(color: AppColors.white),
          ),
          const SizedBox(height: 6),
          Text(
            SiteConfig.clinicTimings,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.white.withValues(alpha: .75),
            ),
          ),
        ],
      ),
    );
  }
}

class _AsideStep extends StatelessWidget {
  const _AsideStep(this.number, this.text);

  final String number;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.coral,
            foregroundColor: AppColors.ink,
            child: Text(
              number,
              style: const TextStyle(fontWeight: FontWeight.w800),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: AppColors.white),
            ),
          ),
        ],
      ),
    );
  }
}
