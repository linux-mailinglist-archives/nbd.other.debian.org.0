Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 979D92439E7
	for <lists+nbd@lfdr.de>; Thu, 13 Aug 2020 14:39:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 773E8203D3; Thu, 13 Aug 2020 12:39:28 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Aug 13 12:39:28 2020
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id F39EC203CE
	for <lists-other-nbd@bendel.debian.org>; Thu, 13 Aug 2020 12:39:14 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.179 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Gp6z_NOaFUt5 for <lists-other-nbd@bendel.debian.org>;
	Thu, 13 Aug 2020 12:39:09 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .redhat. - helo: .us-smtp-delivery-1.mimecast. - helo-domain: .mimecast.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by bendel.debian.org (Postfix) with ESMTP id ED8C9203C7
	for <nbd@other.debian.org>; Thu, 13 Aug 2020 12:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597322342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=i8ev1RcrDNfrPihXRK07U8vTwviZLipAiyP7tCdPt6w=;
	b=WW/E31zNQoGTweWqRDTelZsJ5J4s+qPWc7AaEg+hJqXu3elyIOH2CVgcA85+tszcfiPKjl
	pEk55R0LWkZq/HbaFSEUa9sfIxE7cNyxrtoq/qQsW7m3FDFopNJB5XV71+6KAMh/6uQdcR
	l5i2kuhtJu1YwTR57Sm8WnzUqQM43n0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-04MkuYcCM3iKoYSOuNGckw-1; Thu, 13 Aug 2020 08:38:59 -0400
X-MC-Unique: 04MkuYcCM3iKoYSOuNGckw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2429801AC2;
	Thu, 13 Aug 2020 12:38:57 +0000 (UTC)
Received: from foo.home.annexia.org (ovpn-114-99.ams2.redhat.com [10.36.114.99])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 243FA5C1C2;
	Thu, 13 Aug 2020 12:38:56 +0000 (UTC)
From: "Richard W.M. Jones" <rjones@redhat.com>
To: eric@garver.life
Cc: nbd@other.debian.org,
	firewalld-devel@lists.fedorahosted.org
Subject: [PATCH firewalld] feat: service: add nbd (Network Block Device) service
Date: Thu, 13 Aug 2020 13:38:54 +0100
Message-Id: <20200813123854.967482-1-rjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <NPuObRFqc6B.A.PZ.ASTNfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/931
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200813123854.967482-1-rjones@redhat.com
Resent-Date: Thu, 13 Aug 2020 12:39:28 +0000 (UTC)

---
 config/Makefile.am      | 1 +
 config/services/nbd.xml | 6 ++++++
 po/POTFILES.in          | 1 +
 3 files changed, 8 insertions(+)

diff --git a/config/Makefile.am b/config/Makefile.am
index 61021285..956aba51 100644
--- a/config/Makefile.am
+++ b/config/Makefile.am
@@ -204,6 +204,7 @@ CONFIG_FILES = \
 	services/ms-wbt.xml \
 	services/murmur.xml \
 	services/mysql.xml \
+	services/nbd.xml \
 	services/nfs.xml \
 	services/nfs3.xml \
 	services/nmea-0183.xml \
diff --git a/config/services/nbd.xml b/config/services/nbd.xml
new file mode 100644
index 00000000..f02edefc
--- /dev/null
+++ b/config/services/nbd.xml
@@ -0,0 +1,6 @@
+<?xml version="1.0" encoding="utf-8"?>
+<service>
+  <short>NBD</short>
+  <description>Network Block Device (NBD) is a high-performance protocol for exporting disk images between machines.</description>
+  <port protocol="tcp" port="10809"/>
+</service>
diff --git a/po/POTFILES.in b/po/POTFILES.in
index ed5be3e2..fdd40572 100644
--- a/po/POTFILES.in
+++ b/po/POTFILES.in
@@ -137,6 +137,7 @@ config/services/mssql.xml
 config/services/ms-wbt.xml
 config/services/murmur.xml
 config/services/mysql.xml
+config/services/nbd.xml
 config/services/nfs3.xml
 config/services/nfs.xml
 config/services/nmea-0183.xml
-- 
2.28.0.rc2

