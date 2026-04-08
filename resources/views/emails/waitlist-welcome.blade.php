<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome to WasteWise</title>
</head>
<body style="margin:0; padding:0; font-family: Arial, sans-serif; background-color:#f7fafc; color:#1a202c;">

    <table width="100%" cellpadding="0" cellspacing="0" style="background-color:#f7fafc; padding: 20px 0;">
        <tr>
            <td align="center">

                <!-- Main container -->
                <table width="600" cellpadding="0" cellspacing="0" style="background-color:#ffffff; border-radius:8px; box-shadow:0 4px 10px rgba(0,0,0,0.05); padding: 40px;">
                    
                    <!-- Logo -->
                   

                    <!-- Greeting -->
                    <tr>
                        <td style="font-size:18px; font-weight:bold; padding-bottom: 20px;">
                            Dear {{ $vendor->registrant_name ?? 'Vendor' }},
                        </td>
                    </tr>

                    <!-- Intro -->
                    <tr>
                        <td style="font-size:16px; line-height:1.6; padding-bottom: 20px;">
                            Welcome to <strong>WasteWise Inc. Ltd.</strong>, and thank you for joining our Vendor Waitlist.
                        </td>
                    </tr>

                    <tr>
                        <td style="font-size:16px; line-height:1.6; padding-bottom: 20px;">
                            We’re excited to have you on board as we build a smarter, technology-driven waste management platform connecting vendors to more customers and opportunities.
                        </td>
                    </tr>

                    <!-- What’s next -->
                    <tr>
                        <td style="font-size:16px; line-height:1.6; padding-bottom: 10px;">
                            <strong>What’s next?</strong>
                        </td>
                    </tr>

                    <tr>
                        <td style="padding-bottom: 20px;">
                            <ul style="margin:0; padding-left:20px; line-height:1.6; font-size:16px; color:#4a5568;">
                                <li>Your application is under review</li>
                                <li>Selected vendors will be contacted for onboarding</li>
                                <li>All successfully registered vendors with government-approved documentation will be migrated to the WasteWise app during our pilot phase</li>
                                <li>Updates will be shared as we expand operations in your area</li>
                            </ul>
                        </td>
                    </tr>

                    <!-- Closing paragraph -->
                    <tr>
                        <td style="font-size:16px; line-height:1.6; padding-bottom: 20px;">
                            We appreciate your interest in partnering with us to create cleaner, more sustainable communities.
                        </td>
                    </tr>

                    <!-- Contact -->
                    <tr>
                        <td style="font-size:16px; line-height:1.6; padding-bottom: 30px;">
                            <strong>For inquiries:</strong><br>
                            📧 <a href="mailto:support@wastewiseinc.com" style="color:#3182ce; text-decoration:none;">support@wastewiseinc.com</a><br>
                            📞 +234 902 501 3289
                        </td>
                    </tr>

                    <!-- Footer / Signature -->
                    <tr>
                        <td style="font-size:16px; line-height:1.6; padding-top: 10px; border-top:1px solid #e2e8f0;">
                            Warm regards,<br>
                            <strong>WasteWise Team</strong><br>
                            WasteWise Inc. Ltd.
                        </td>
                    </tr>

                </table>

            </td>
        </tr>
    </table>

</body>
</html>