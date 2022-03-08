Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id A40F54D20E3
	for <lists+nbd@lfdr.de>; Tue,  8 Mar 2022 20:06:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6A581201FB; Tue,  8 Mar 2022 19:06:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Mar  8 19:06:10 2022
Old-Return-Path: <0101017f6acd9361-2a229b31-7e6b-42c2-915d-8ef67ccf7312-000000@us-west-2.amazonses.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=4.0 tests=DIGITS_LETTERS,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A561A20263
	for <lists-other-nbd@bendel.debian.org>; Tue,  8 Mar 2022 18:49:53 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=3.458 tagged_above=-10000 required=5.3
	tests=[DIGITS_LETTERS=1, DKIM_INVALID=0.1, DKIM_SIGNED=0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.248, HTML_MESSAGE=2,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id MSW_Dk4iyfo9 for <lists-other-nbd@bendel.debian.org>;
	Tue,  8 Mar 2022 18:49:48 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 1050 seconds by postgrey-1.36 at bendel; Tue, 08 Mar 2022 18:49:48 UTC
Received: from a62-75.smtp-out.us-west-2.amazonses.com (a62-75.smtp-out.us-west-2.amazonses.com [54.240.62.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 0725520275
	for <nbd@other.debian.org>; Tue,  8 Mar 2022 18:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1646764331;
	h=From:Date:Subject:Message-Id:To:Cc:MIME-Version:Content-Type:Feedback-ID;
	bh=jvI4XC78XZdN+HrfnDgZPdDGkTA7Q/CWJwaW3xypLhs=;
	b=MmznNs8RYZmZ6j88/MccNVAuoeGreLjiNlq5kMtrxPfQG1g5kYWD/XOFvcTx2bv5
	1ZTQmcoVuvpyiHvN8g2S7rIbZigCZrHulzrsuRnlYSzvCEJDxIQCOqG5T3GXWwUvGji
	erOO7ZbB1q+S7shVwM3t/bYGA60uUAYCg2yCnH7E=
From: ticketsupport@incontactemail.com
Date: Tue, 8 Mar 2022 18:32:11 +0000
Subject: RE: AW: [PATCH 2/2] nbd-trplay: Add test case
Message-ID: <0101017f6acd9361-2a229b31-7e6b-42c2-915d-8ef67ccf7312-000000@us-west-2.amazonses.com>
To: Manfred.Spraul@de.bosch.com, manfred@colorfullife.com,
 nbd@other.debian.org
Cc: w@uter.be
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary=part_c80d2c44_ed03_452a_a43e_347a16068009
Feedback-ID: 1.us-west-2.xgvvsEBmNFCPGQycQIp2ohiutGFA7Wl3Wx4Y99itgcM=:AmazonSES
X-SES-Outgoing: 2022.03.08-54.240.62.75
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <9xKhl-eWxl.A.LsB.ik6JiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1732
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/0101017f6acd9361-2a229b31-7e6b-42c2-915d-8ef67ccf7312-000000@us-west-2.amazonses.com
Resent-Date: Tue,  8 Mar 2022 19:06:10 +0000 (UTC)

--part_c80d2c44_ed03_452a_a43e_347a16068009
Content-Type: text/plain; charset=utf-8

<div>
<div>Hi,&nbsp;</div>
<div>&nbsp;</div>
<div>Thank you for contacting us. I&rsquo;ll be more than glad to assist you.&nbsp;</div>
<div>Please reply with the order number, billing zip code, and phone number associated with your purchase. We will be more than happy to continue searching for your order. We ask that you check your bank statement to confirm which company was billed for your tickets. You will be able to find the phone number associated with your purchase there as well.&nbsp;</div>
<div>&nbsp;</div>
<div>Please feel free to reply to this e-mail if you have any additional questions or immediate concerns.</div>
<div>&nbsp;</div>
<div>Thank you for contacting us, Have a great day!</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>Veronica A.</div>
<div>Customer Support</div>
<div>&nbsp;</div>
<hr />From: Manfred.Spraul@de.bosch.com <br />Sent: Tue Mar 08 2022 15:00:01 GMT+0800 (Singapore Standard Time) <br />To: manfred@colorfullife.com;nbd@other.debian.org <br />Subject: AW: [PATCH 2/2] nbd-trplay: Add test case </div>
Hi,<br /><br />Replying to myself:<br />&gt; diff --git a/tests/run/Makefile.am b/tests/run/Makefile.am index f41eb8d..4c2f635 100644<br />&gt; --- a/tests/run/Makefile.am<br />&gt; +++ b/tests/run/Makefile.am<br />&gt; @@ -4,7 +4,7 @@ else<br />&gt; TLSSRC =<br />&gt; endif<br />&gt; TESTS_ENVIRONMENT=$(srcdir)/simple_test<br />&gt; -TESTS = cfg1 cfgmulti cfgnew cfgsize write flush integrity dirconfig list inetd \\<br />&gt; +TESTS = cfg1 cfgmulti cfgnew cfgsize write flush integrity replay <br />&gt; +dirconfig list inetd \\<br />&gt; \trowrite tree rotree unix integrityhuge handshake tls tlswrongcert tlshuge XFAIL_TESTS=@RUN_XFAIL@ check_PROGRAMS = nbd-tester-client @@ -19,7 +19,7 @@ nbd_tester_client_CFLAGS += @GnuTLS_CFLAGS@ nbd_tester_client_LDADD += @GnuTLS_LIBS@ endif CLEANFILES = buffer.c crypto-gnutls.c cliserv.c -EXTRA_DIST = integrity-test.tr integrityhuge-test.tr simple_test certs/client-key.pem certs/client-cert.pem certs/server-cert.pem certs/ca-cert.pem certs/ca.info 
 certs/client.info certs/server-key.pem certs/ca-key.pem certs/server.info certs/README.md certs/selfsigned-cert.pem certs/selfsigned-key.pem<br />&gt; +EXTRA_DIST = integrity-test.tr integrityhuge-test.tr replay-test.tr <br />&gt; +simple_test certs/client-key.pem certs/client-cert.pem <br />&gt; +certs/server-cert.pem certs/ca-cert.pem certs/ca.info certs/client.info <br />&gt; +certs/server-key.pem certs/ca-key.pem certs/server.info certs/README.md <br />&gt; +certs/selfsigned-cert.pem certs/selfsigned-key.pem<br /><br />This can't be correct. I wanted to add replay-test.tr to a line, not add 5 new lines :-(<br /><br />I'll resend later today.<br /><br /><br />Mit freundlichen Gr&uuml;&szlig;en / Best regards<br /><br />Manfred Spraul <br /><br />Cross-Domain Computing Solutions, Project Quality Management Software (XC/QMM21-CT)<br />Robert Bosch GmbH | Postfach | 31132 Hildesheim | GERMANY | www.bosch.com<br />Tel. +49 5121 49-5289 | Mobile +49 173 7213949 | Fax +49 711 811-50552
 89 | Manfred.Spraul@de.bosch.com<br /><br />Registered Office: Stuttgart, Registration Court: Amtsgericht Stuttgart, HRB 14000;<br />Chairman of the Supervisory Board: Prof. Dr. Stefan Asenkerschbaumer; Managing Directors: Dr. Stefan Hartung, <br />Dr. Christian Fischer, Filiz Albrecht, Dr. Markus Forschner, Dr. Markus Heyn, Rolf Najork
--part_c80d2c44_ed03_452a_a43e_347a16068009
Content-Type: text/html; charset=utf-8
Content-Id: <40TGLYLL9GU4.2YKEOMDZQ05O1@send-email-api>

<div>
<div>Hi,&nbsp;</div>
<div>&nbsp;</div>
<div>Thank you for contacting us. I&rsquo;ll be more than glad to assist you.&nbsp;</div>
<div>Please reply with the order number, billing zip code, and phone number associated with your purchase. We will be more than happy to continue searching for your order. We ask that you check your bank statement to confirm which company was billed for your tickets. You will be able to find the phone number associated with your purchase there as well.&nbsp;</div>
<div>&nbsp;</div>
<div>Please feel free to reply to this e-mail if you have any additional questions or immediate concerns.</div>
<div>&nbsp;</div>
<div>Thank you for contacting us, Have a great day!</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>Veronica A.</div>
<div>Customer Support</div>
<div>&nbsp;</div>
<hr />From: Manfred.Spraul@de.bosch.com <br />Sent: Tue Mar 08 2022 15:00:01 GMT+0800 (Singapore Standard Time) <br />To: manfred@colorfullife.com;nbd@other.debian.org <br />Subject: AW: [PATCH 2/2] nbd-trplay: Add test case </div>
Hi,<br /><br />Replying to myself:<br />&gt; diff --git a/tests/run/Makefile.am b/tests/run/Makefile.am index f41eb8d..4c2f635 100644<br />&gt; --- a/tests/run/Makefile.am<br />&gt; +++ b/tests/run/Makefile.am<br />&gt; @@ -4,7 +4,7 @@ else<br />&gt; TLSSRC =<br />&gt; endif<br />&gt; TESTS_ENVIRONMENT=$(srcdir)/simple_test<br />&gt; -TESTS = cfg1 cfgmulti cfgnew cfgsize write flush integrity dirconfig list inetd \\<br />&gt; +TESTS = cfg1 cfgmulti cfgnew cfgsize write flush integrity replay <br />&gt; +dirconfig list inetd \\<br />&gt; \trowrite tree rotree unix integrityhuge handshake tls tlswrongcert tlshuge XFAIL_TESTS=@RUN_XFAIL@ check_PROGRAMS = nbd-tester-client @@ -19,7 +19,7 @@ nbd_tester_client_CFLAGS += @GnuTLS_CFLAGS@ nbd_tester_client_LDADD += @GnuTLS_LIBS@ endif CLEANFILES = buffer.c crypto-gnutls.c cliserv.c -EXTRA_DIST = integrity-test.tr integrityhuge-test.tr simple_test certs/client-key.pem certs/client-cert.pem certs/server-cert.pem certs/ca-cert.pem certs/ca.info 
 certs/client.info certs/server-key.pem certs/ca-key.pem certs/server.info certs/README.md certs/selfsigned-cert.pem certs/selfsigned-key.pem<br />&gt; +EXTRA_DIST = integrity-test.tr integrityhuge-test.tr replay-test.tr <br />&gt; +simple_test certs/client-key.pem certs/client-cert.pem <br />&gt; +certs/server-cert.pem certs/ca-cert.pem certs/ca.info certs/client.info <br />&gt; +certs/server-key.pem certs/ca-key.pem certs/server.info certs/README.md <br />&gt; +certs/selfsigned-cert.pem certs/selfsigned-key.pem<br /><br />This can't be correct. I wanted to add replay-test.tr to a line, not add 5 new lines :-(<br /><br />I'll resend later today.<br /><br /><br />Mit freundlichen Gr&uuml;&szlig;en / Best regards<br /><br />Manfred Spraul <br /><br />Cross-Domain Computing Solutions, Project Quality Management Software (XC/QMM21-CT)<br />Robert Bosch GmbH | Postfach | 31132 Hildesheim | GERMANY | www.bosch.com<br />Tel. +49 5121 49-5289 | Mobile +49 173 7213949 | Fax +49 711 811-50552
 89 | Manfred.Spraul@de.bosch.com<br /><br />Registered Office: Stuttgart, Registration Court: Amtsgericht Stuttgart, HRB 14000;<br />Chairman of the Supervisory Board: Prof. Dr. Stefan Asenkerschbaumer; Managing Directors: Dr. Stefan Hartung, <br />Dr. Christian Fischer, Filiz Albrecht, Dr. Markus Forschner, Dr. Markus Heyn, Rolf Najork
--part_c80d2c44_ed03_452a_a43e_347a16068009--

