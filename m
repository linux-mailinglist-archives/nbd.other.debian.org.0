Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC214DE218
	for <lists+nbd@lfdr.de>; Fri, 18 Mar 2022 21:05:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0B362202FF; Fri, 18 Mar 2022 20:05:25 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Mar 18 20:05:25 2022
Old-Return-Path: <manfred@colorfullife.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE,WORD_WITHOUT_VOWELS
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6F936202BE
	for <lists-other-nbd@bendel.debian.org>; Fri, 18 Mar 2022 20:05:16 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.99 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01,
	WORD_WITHOUT_VOWELS=1] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 8kLO33v2OEBc for <lists-other-nbd@bendel.debian.org>;
	Fri, 18 Mar 2022 20:05:10 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .colorfullife. - helo: .mail-ej1-x636.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 85378202A0
	for <nbd@other.debian.org>; Fri, 18 Mar 2022 20:05:09 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id p15so19052435ejc.7
        for <nbd@other.debian.org>; Fri, 18 Mar 2022 13:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorfullife-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dy+OVgB8D6PjdMfFU72P0AsAWOOqKDbP0sFbUNydHDc=;
        b=ibgXWF1eWzy6zcMBgJiEeXBNXnY0omE79Z207BU2pRAfzLz8EGwYfqeiqwCimR2OjG
         hhDvvf1notv9VvJ/CoFVwdubK6OqameLKN8C1VckVFyOTgLHJQ5hu5Ue7K01ZG9ErQ+2
         TFTBJNDFRuGMj2wIbOd/YhZaWZNTJ+2R8o+kCXPlrKvfXmtLobQS36GAWeUjLCO9uc3z
         e+FUq1ToroHgcpfAgnJ0DiPneFciYDjU8jJDBTaYTJs+e0jNZaK5t3OR4+U2EtrfmknJ
         +liSK0+xrMMtSxzOm1nvjhhA0dkNMnfhSSIQ7lMpdo2D8kH2YH7Pv9xw1uh0nwzOkop5
         N6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dy+OVgB8D6PjdMfFU72P0AsAWOOqKDbP0sFbUNydHDc=;
        b=gR4gqnQpoa3R3u9LCCmxeCW1N+6OUa2Yyqdx/Y/FoqLaM2e2uV3dmBmC6rqc+2H6PN
         iNpmM7jpI/gsutg1+P2UBiVUieXVc21tuc8qdaqEI+5c+WRLgVmgpL2P9YnaC4oV+fYC
         6PdQnbTDC0l/4It13IYkLtHY9ihnsy5b6uRUg9XTEe6Vnz5mAJbjlLYQnOXTa9IPSQ7l
         XT3sAWwQfATaPkSAAYHQOsa/ySbv3Gbxssbt3H3QDWl4Um42VIK2nx53mU/UC2RAjVqT
         hjQ1TivctAHRS3w2b29VNAYYnr6dsgKTM1zdaSSWl2uArpShmpPBnUJo9Me2LGQ92LUj
         51Pg==
X-Gm-Message-State: AOAM530y3qNI2lE9lDXjvGybIoDNwPf+PwXjn39a1yICX6YGdfxSu2of
	yJq3zS4fFD2E3wWxTeXaB9lfTQ==
X-Google-Smtp-Source: ABdhPJzANpU0BJgr/9pLyM22LFo+Utp9gpkeuO5HCBSoNEYSf2yBg9XWiZjBBqtp93/t8xA+NBUUuw==
X-Received: by 2002:a17:906:794e:b0:6df:b112:5e3f with SMTP id l14-20020a170906794e00b006dfb1125e3fmr5048539ejo.211.1647633906981;
        Fri, 18 Mar 2022 13:05:06 -0700 (PDT)
Received: from localhost.localdomain (p200300d99706e5008ba5d28248ff808c.dip0.t-ipconnect.de. [2003:d9:9706:e500:8ba5:d282:48ff:808c])
        by smtp.googlemail.com with ESMTPSA id j7-20020a1709062a0700b006bc28a6b8f1sm4042697eje.222.2022.03.18.13.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Mar 2022 13:05:06 -0700 (PDT)
From: Manfred Spraul <manfred@colorfullife.com>
To: linux-doc@vger.kernel.org
Cc: nbd@other.debian.org,
	Wouter Verhelst <w@uter.be>,
	Manfred Spraul <manfred.spraul@de.bosch.com>
Subject: [PATCH] Doc update: Correct magic values from nbd protocol
Date: Fri, 18 Mar 2022 21:04:46 +0100
Message-Id: <20220318200446.14648-1-manfred@colorfullife.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <n2cI-gb-6i.A.OT.EYONiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1736
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220318200446.14648-1-manfred@colorfullife.com
Resent-Date: Fri, 18 Mar 2022 20:05:25 +0000 (UTC)

From: Manfred Spraul <manfred.spraul@de.bosch.com>

The magic number documentation refers to old values for
BD_REQUEST_MAGIC and NBD_REPLY_MAGIC: The documented values were used
until Linux 2.1.116pre2.

Thus:
- Update the documentation
- Update the header file: The authorative source for the nbd protocol
  is proto.md from the nbd package, thus mention this.
- Remove the historic values from the header file.
  The historic values are still documented in proto.md from the nbd
  package.

See also the nbd mailing list (link below).

Link: https://lists.debian.org/nbd/2022/01/msg00039.html
Signed-off-by: Manfred Spraul <manfred.spraul@de.bosch.com>
---
 Documentation/process/magic-number.rst                    | 4 ++--
 Documentation/translations/it_IT/process/magic-number.rst | 4 ++--
 Documentation/translations/zh_CN/process/magic-number.rst | 4 ++--
 Documentation/translations/zh_TW/process/magic-number.rst | 4 ++--
 include/uapi/linux/nbd.h                                  | 3 ++-
 5 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/Documentation/process/magic-number.rst b/Documentation/process/magic-number.rst
index f5ba36e96461..133ecfa10607 100644
--- a/Documentation/process/magic-number.rst
+++ b/Documentation/process/magic-number.rst
@@ -96,11 +96,11 @@ USB_SERIAL_PORT_MAGIC 0x7301           usb_serial_port          ``drivers/usb/se
 CG_MAGIC              0x00090255       ufs_cylinder_group       ``include/linux/ufs_fs.h``
 LSEMAGIC              0x05091998       lse                      ``drivers/fc4/fc.c``
 RIEBL_MAGIC           0x09051990                                ``drivers/net/atarilance.c``
-NBD_REQUEST_MAGIC     0x12560953       nbd_request              ``include/linux/nbd.h``
 RED_MAGIC2            0x170fc2a5       (any)                    ``mm/slab.c``
 BAYCOM_MAGIC          0x19730510       baycom_state             ``drivers/net/baycom_epp.c``
 ISDN_X25IFACE_MAGIC   0x1e75a2b9       isdn_x25iface_proto_data ``drivers/isdn/isdn_x25iface.h``
 ECP_MAGIC             0x21504345       cdkecpsig                ``include/linux/cdk.h``
+NBD_REQUEST_MAGIC     0x25609513       nbd_request              ``include/uapi/linux/nbd.h``
 LSOMAGIC              0x27091997       lso                      ``drivers/fc4/fc.c``
 LSMAGIC               0x2a3b4d2a       ls                       ``drivers/fc4/fc.c``
 WANPIPE_MAGIC         0x414C4453       sdla_{dump,exec}         ``include/linux/wanpipe.h``
@@ -129,12 +129,12 @@ M3_CARD_MAGIC         0x646e6f50       m3_card                  ``sound/oss/maes
 FW_HEADER_MAGIC       0x65726F66       fw_header                ``drivers/atm/fore200e.h``
 SLOT_MAGIC            0x67267321       slot                     ``drivers/hotplug/cpqphp.h``
 SLOT_MAGIC            0x67267322       slot                     ``drivers/hotplug/acpiphp.h``
+NBD_REPLY_MAGIC       0x67446698       nbd_reply                ``include/uapi/linux/nbd.h``
 LO_MAGIC              0x68797548       nbd_device               ``include/linux/nbd.h``
 M3_STATE_MAGIC        0x734d724d       m3_state                 ``sound/oss/maestro3.c``
 VMALLOC_MAGIC         0x87654320       snd_alloc_track          ``sound/core/memory.c``
 KMALLOC_MAGIC         0x87654321       snd_alloc_track          ``sound/core/memory.c``
 PWC_MAGIC             0x89DC10AB       pwc_device               ``drivers/usb/media/pwc.h``
-NBD_REPLY_MAGIC       0x96744668       nbd_reply                ``include/linux/nbd.h``
 ENI155_MAGIC          0xa54b872d       midway_eprom	        ``drivers/atm/eni.h``
 CODA_MAGIC            0xC0DAC0DA       coda_file_info           ``fs/coda/coda_fs_i.h``
 YAM_MAGIC             0xF10A7654       yam_port                 ``drivers/net/hamradio/yam.c``
diff --git a/Documentation/translations/it_IT/process/magic-number.rst b/Documentation/translations/it_IT/process/magic-number.rst
index f452fafb1e84..17401994f2e8 100644
--- a/Documentation/translations/it_IT/process/magic-number.rst
+++ b/Documentation/translations/it_IT/process/magic-number.rst
@@ -102,11 +102,11 @@ USB_SERIAL_PORT_MAGIC 0x7301           usb_serial_port          ``drivers/usb/se
 CG_MAGIC              0x00090255       ufs_cylinder_group       ``include/linux/ufs_fs.h``
 LSEMAGIC              0x05091998       lse                      ``drivers/fc4/fc.c``
 RIEBL_MAGIC           0x09051990                                ``drivers/net/atarilance.c``
-NBD_REQUEST_MAGIC     0x12560953       nbd_request              ``include/linux/nbd.h``
 RED_MAGIC2            0x170fc2a5       (any)                    ``mm/slab.c``
 BAYCOM_MAGIC          0x19730510       baycom_state             ``drivers/net/baycom_epp.c``
 ISDN_X25IFACE_MAGIC   0x1e75a2b9       isdn_x25iface_proto_data ``drivers/isdn/isdn_x25iface.h``
 ECP_MAGIC             0x21504345       cdkecpsig                ``include/linux/cdk.h``
+NBD_REQUEST_MAGIC     0x25609513       nbd_request              ``include/uapi/linux/nbd.h``
 LSOMAGIC              0x27091997       lso                      ``drivers/fc4/fc.c``
 LSMAGIC               0x2a3b4d2a       ls                       ``drivers/fc4/fc.c``
 WANPIPE_MAGIC         0x414C4453       sdla_{dump,exec}         ``include/linux/wanpipe.h``
@@ -135,12 +135,12 @@ M3_CARD_MAGIC         0x646e6f50       m3_card                  ``sound/oss/maes
 FW_HEADER_MAGIC       0x65726F66       fw_header                ``drivers/atm/fore200e.h``
 SLOT_MAGIC            0x67267321       slot                     ``drivers/hotplug/cpqphp.h``
 SLOT_MAGIC            0x67267322       slot                     ``drivers/hotplug/acpiphp.h``
+NBD_REPLY_MAGIC       0x67446698       nbd_reply                ``include/uapi/linux/nbd.h``
 LO_MAGIC              0x68797548       nbd_device               ``include/linux/nbd.h``
 M3_STATE_MAGIC        0x734d724d       m3_state                 ``sound/oss/maestro3.c``
 VMALLOC_MAGIC         0x87654320       snd_alloc_track          ``sound/core/memory.c``
 KMALLOC_MAGIC         0x87654321       snd_alloc_track          ``sound/core/memory.c``
 PWC_MAGIC             0x89DC10AB       pwc_device               ``drivers/usb/media/pwc.h``
-NBD_REPLY_MAGIC       0x96744668       nbd_reply                ``include/linux/nbd.h``
 ENI155_MAGIC          0xa54b872d       midway_eprom	        ``drivers/atm/eni.h``
 CODA_MAGIC            0xC0DAC0DA       coda_file_info           ``fs/coda/coda_fs_i.h``
 YAM_MAGIC             0xF10A7654       yam_port                 ``drivers/net/hamradio/yam.c``
diff --git a/Documentation/translations/zh_CN/process/magic-number.rst b/Documentation/translations/zh_CN/process/magic-number.rst
index 42f0635ca70a..1b376fe087b5 100644
--- a/Documentation/translations/zh_CN/process/magic-number.rst
+++ b/Documentation/translations/zh_CN/process/magic-number.rst
@@ -86,11 +86,11 @@ CG_MAGIC              0x00090255       ufs_cylinder_group       ``include/linux/
 LSEMAGIC              0x05091998       lse                      ``drivers/fc4/fc.c``
 GDTIOCTL_MAGIC        0x06030f07       gdth_iowr_str            ``drivers/scsi/gdth_ioctl.h``
 RIEBL_MAGIC           0x09051990                                ``drivers/net/atarilance.c``
-NBD_REQUEST_MAGIC     0x12560953       nbd_request              ``include/linux/nbd.h``
 RED_MAGIC2            0x170fc2a5       (any)                    ``mm/slab.c``
 BAYCOM_MAGIC          0x19730510       baycom_state             ``drivers/net/baycom_epp.c``
 ISDN_X25IFACE_MAGIC   0x1e75a2b9       isdn_x25iface_proto_data ``drivers/isdn/isdn_x25iface.h``
 ECP_MAGIC             0x21504345       cdkecpsig                ``include/linux/cdk.h``
+NBD_REQUEST_MAGIC     0x25609513       nbd_request              ``include/uapi/linux/nbd.h``
 LSOMAGIC              0x27091997       lso                      ``drivers/fc4/fc.c``
 LSMAGIC               0x2a3b4d2a       ls                       ``drivers/fc4/fc.c``
 WANPIPE_MAGIC         0x414C4453       sdla_{dump,exec}         ``include/linux/wanpipe.h``
@@ -119,12 +119,12 @@ M3_CARD_MAGIC         0x646e6f50       m3_card                  ``sound/oss/maes
 FW_HEADER_MAGIC       0x65726F66       fw_header                ``drivers/atm/fore200e.h``
 SLOT_MAGIC            0x67267321       slot                     ``drivers/hotplug/cpqphp.h``
 SLOT_MAGIC            0x67267322       slot                     ``drivers/hotplug/acpiphp.h``
+NBD_REPLY_MAGIC       0x67446698       nbd_reply                ``include/uapi/linux/nbd.h``
 LO_MAGIC              0x68797548       nbd_device               ``include/linux/nbd.h``
 M3_STATE_MAGIC        0x734d724d       m3_state                 ``sound/oss/maestro3.c``
 VMALLOC_MAGIC         0x87654320       snd_alloc_track          ``sound/core/memory.c``
 KMALLOC_MAGIC         0x87654321       snd_alloc_track          ``sound/core/memory.c``
 PWC_MAGIC             0x89DC10AB       pwc_device               ``drivers/usb/media/pwc.h``
-NBD_REPLY_MAGIC       0x96744668       nbd_reply                ``include/linux/nbd.h``
 ENI155_MAGIC          0xa54b872d       midway_eprom	        ``drivers/atm/eni.h``
 CODA_MAGIC            0xC0DAC0DA       coda_file_info           ``fs/coda/coda_fs_i.h``
 DPMEM_MAGIC           0xc0ffee11       gdt_pci_sram             ``drivers/scsi/gdth.h``
diff --git a/Documentation/translations/zh_TW/process/magic-number.rst b/Documentation/translations/zh_TW/process/magic-number.rst
index ae321a9aaece..ff385a369c7b 100644
--- a/Documentation/translations/zh_TW/process/magic-number.rst
+++ b/Documentation/translations/zh_TW/process/magic-number.rst
@@ -89,11 +89,11 @@ CG_MAGIC              0x00090255       ufs_cylinder_group       ``include/linux/
 LSEMAGIC              0x05091998       lse                      ``drivers/fc4/fc.c``
 GDTIOCTL_MAGIC        0x06030f07       gdth_iowr_str            ``drivers/scsi/gdth_ioctl.h``
 RIEBL_MAGIC           0x09051990                                ``drivers/net/atarilance.c``
-NBD_REQUEST_MAGIC     0x12560953       nbd_request              ``include/linux/nbd.h``
 RED_MAGIC2            0x170fc2a5       (any)                    ``mm/slab.c``
 BAYCOM_MAGIC          0x19730510       baycom_state             ``drivers/net/baycom_epp.c``
 ISDN_X25IFACE_MAGIC   0x1e75a2b9       isdn_x25iface_proto_data ``drivers/isdn/isdn_x25iface.h``
 ECP_MAGIC             0x21504345       cdkecpsig                ``include/linux/cdk.h``
+NBD_REQUEST_MAGIC     0x25609513       nbd_request              ``include/uapi/linux/nbd.h``
 LSOMAGIC              0x27091997       lso                      ``drivers/fc4/fc.c``
 LSMAGIC               0x2a3b4d2a       ls                       ``drivers/fc4/fc.c``
 WANPIPE_MAGIC         0x414C4453       sdla_{dump,exec}         ``include/linux/wanpipe.h``
@@ -122,12 +122,12 @@ M3_CARD_MAGIC         0x646e6f50       m3_card                  ``sound/oss/maes
 FW_HEADER_MAGIC       0x65726F66       fw_header                ``drivers/atm/fore200e.h``
 SLOT_MAGIC            0x67267321       slot                     ``drivers/hotplug/cpqphp.h``
 SLOT_MAGIC            0x67267322       slot                     ``drivers/hotplug/acpiphp.h``
+NBD_REPLY_MAGIC       0x67446698       nbd_reply                ``include/uapi/linux/nbd.h``
 LO_MAGIC              0x68797548       nbd_device               ``include/linux/nbd.h``
 M3_STATE_MAGIC        0x734d724d       m3_state                 ``sound/oss/maestro3.c``
 VMALLOC_MAGIC         0x87654320       snd_alloc_track          ``sound/core/memory.c``
 KMALLOC_MAGIC         0x87654321       snd_alloc_track          ``sound/core/memory.c``
 PWC_MAGIC             0x89DC10AB       pwc_device               ``drivers/usb/media/pwc.h``
-NBD_REPLY_MAGIC       0x96744668       nbd_reply                ``include/linux/nbd.h``
 ENI155_MAGIC          0xa54b872d       midway_eprom	        ``drivers/atm/eni.h``
 CODA_MAGIC            0xC0DAC0DA       coda_file_info           ``fs/coda/coda_fs_i.h``
 DPMEM_MAGIC           0xc0ffee11       gdt_pci_sram             ``drivers/scsi/gdth.h``
diff --git a/include/uapi/linux/nbd.h b/include/uapi/linux/nbd.h
index 20d6cc91435d..88752b20e6c8 100644
--- a/include/uapi/linux/nbd.h
+++ b/include/uapi/linux/nbd.h
@@ -11,6 +11,8 @@
  *            Cleanup PARANOIA usage & code.
  * 2004/02/19 Paul Clements
  *            Removed PARANOIA, plus various cleanup and comments
+ *
+ * See doc/proto.md of the nbd package for more details on the protocol.
  */
 
 #ifndef _UAPILINUX_NBD_H
@@ -63,7 +65,6 @@ enum {
 
 #define NBD_REQUEST_MAGIC 0x25609513
 #define NBD_REPLY_MAGIC 0x67446698
-/* Do *not* use magics: 0x12560953 0x96744668. */
 
 /*
  * This is the packet used for communication between client and
-- 
2.35.1

