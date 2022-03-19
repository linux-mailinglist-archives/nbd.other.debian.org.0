Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEE14DE7CC
	for <lists+nbd@lfdr.de>; Sat, 19 Mar 2022 13:13:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B5C852051C; Sat, 19 Mar 2022 12:13:05 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Mar 19 12:13:05 2022
Old-Return-Path: <manfred@colorfullife.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,FOURLA,FVGT_m_MULTI_ODD,LDOSUBSCRIBER,LDO_WHITELIST,
	MD5_SHA1_SUM,MONEY,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,STOCKLIKE,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6D64420519
	for <lists-other-nbd@bendel.debian.org>; Sat, 19 Mar 2022 12:12:41 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.37 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, FOURLA=0.1, FVGT_m_MULTI_ODD=0.02, LDO_WHITELIST=-5,
	MD5_SHA1_SUM=-1, MONEY=0.5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, STOCKLIKE=1, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id m7d0H4MgQf93 for <lists-other-nbd@bendel.debian.org>;
	Sat, 19 Mar 2022 12:12:35 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .colorfullife. - helo: .mail-ed1-x530.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id DFF6020524
	for <nbd@other.debian.org>; Sat, 19 Mar 2022 12:12:35 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id r23so13108174edb.0
        for <nbd@other.debian.org>; Sat, 19 Mar 2022 05:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorfullife-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=diIBTzUShob3oQoFJCO1/xXjMI+bYxYNJBD6tK8v5qI=;
        b=JQN4uu9YCM00xfB4WG0c+vf+B7X9dFGHCilAMq7zR+gCjMjwscZ6gr5clyzp7XLZxh
         I7vszFv50vfU7lWdhb5+ljIYeJKRjRQEREycB65p0qEedVP0ez4AwncP7AI6Vw9zVVjp
         LRz4O+hOQWlJXiRqAmEz8GB8HjXrGZ0IADmBZ2s0Al3YRKSYkVne87vFZkCAPDqR4eZR
         WVKCSiWmjirHSVPW8UHT1p9TfjBEHw6A5zsDPGaopxlodKEJ1VFJqHr6Jh0qP5g6P09Q
         xzJjYTJTYpG4HRN0WwY+b4qZqnvtdSwvrFvYvAiM+C1OXmJHDbVgby/WniuBp9w9alhj
         IE1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=diIBTzUShob3oQoFJCO1/xXjMI+bYxYNJBD6tK8v5qI=;
        b=rzzZ/GwCQsqJ5PVRfSuINrCKO96CQcULNuZYUf9h5JSUmfxcFAvmrRMDUeNCnPPb/k
         4QblcNFbDcIuxlovBjTNLI+TkGLjhBhPD3lJAfKG2c6HTzLWBPSZRgMp6pLJyVtOO40M
         N1OLDPiwQhi729dIwbSJuoofEf6y5y0V9y5x4+QFfANs3p1esxII/DCFYJyfcTknSrEC
         TEZgFsTFyFDSUz4LD9xfsvtBIC/XpxZUWLGhX2XSei4zTt++dU+/vZx3kFhhAxW18T9o
         iHu5qVQboreX34iSQhq9nlZZI6S2DT8zHCCELAVqFe+gSeh5rskVFqgDIlRKYNeAZaJZ
         +qsg==
X-Gm-Message-State: AOAM532tFIPWRCOLj6fXTkxUHcgtpfkIQSxKIT0mNaKQz963ZZQ36/qp
	nb6bDLDuKjDllFCl9k3xcdOe0vpRTQBROA==
X-Google-Smtp-Source: ABdhPJzAL7w8d6fi7ujoP4ZPZPLddbmTIllvHEzIKnqyxkgeV8fUprDiBid6boM4z+GxHOiDssHa/Q==
X-Received: by 2002:aa7:cac8:0:b0:410:cc6c:6512 with SMTP id l8-20020aa7cac8000000b00410cc6c6512mr14285676edt.408.1647691953198;
        Sat, 19 Mar 2022 05:12:33 -0700 (PDT)
Received: from localhost.localdomain (p200300d9974079002dc18ae79cfc5336.dip0.t-ipconnect.de. [2003:d9:9740:7900:2dc1:8ae7:9cfc:5336])
        by smtp.googlemail.com with ESMTPSA id ch26-20020a0564021bda00b00418f99695f0sm3757757edb.23.2022.03.19.05.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Mar 2022 05:12:32 -0700 (PDT)
From: Manfred Spraul <manfred@colorfullife.com>
To: nbd@other.debian.org,
	Wouter Verhelst <w@uter.be>
Cc: Manfred Spraul <manfred.spraul@de.bosch.com>
Subject: [PATCH 3/3] nbd-trplay: Add test case
Date: Sat, 19 Mar 2022 13:12:27 +0100
Message-Id: <20220319121227.39165-4-manfred@colorfullife.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220319121227.39165-1-manfred@colorfullife.com>
References: <20220319121227.39165-1-manfred@colorfullife.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <JiHLol5bWzN.A.pkH.RjcNiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1740
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220319121227.39165-4-manfred@colorfullife.com
Resent-Date: Sat, 19 Mar 2022 12:13:05 +0000 (UTC)

From: Manfred Spraul <manfred.spraul@de.bosch.com>

Add a test case for nbd-trplay.

Signed-off-by: Manfred Spraul <manfred.spraul@de.bosch.com>
---
 tests/run/Makefile.am    |   5 +--
 tests/run/replay-test.tr | Bin 0 -> 116 bytes
 tests/run/simple_test    |  65 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 68 insertions(+), 2 deletions(-)
 create mode 100644 tests/run/replay-test.tr

diff --git a/tests/run/Makefile.am b/tests/run/Makefile.am
index 08f9b09..19efc0b 100644
--- a/tests/run/Makefile.am
+++ b/tests/run/Makefile.am
@@ -8,7 +8,7 @@ TESTS_ENVIRONMENT=$(srcdir)/cwrap_test
 else
 TESTS_ENVIRONMENT=$(srcdir)/simple_test
 endif
-TESTS = cfg1 cfgmulti cfgnew cfgsize write flush integrity dirconfig list inetd \
+TESTS = cfg1 cfgmulti cfgnew cfgsize write flush integrity replay dirconfig list inetd \
 	rowrite tree rotree unix integrityhuge handshake tls tlswrongcert tlshuge
 XFAIL_TESTS=@RUN_XFAIL@
 check_PROGRAMS = nbd-tester-client
@@ -23,7 +23,7 @@ nbd_tester_client_CFLAGS += @GnuTLS_CFLAGS@
 nbd_tester_client_LDADD += @GnuTLS_LIBS@
 endif
 CLEANFILES = buffer.c crypto-gnutls.c cliserv.c
-EXTRA_DIST = integrity-test.tr integrityhuge-test.tr simple_test certs/client-key.pem certs/client-cert.pem certs/server-cert.pem certs/ca-cert.pem certs/ca.info certs/client.info certs/server-key.pem certs/ca-key.pem certs/server.info certs/README.md certs/selfsigned-cert.pem certs/selfsigned-key.pem
+EXTRA_DIST = integrity-test.tr integrityhuge-test.tr replay-test.tr simple_test certs/client-key.pem certs/client-cert.pem certs/server-cert.pem certs/ca-cert.pem certs/ca.info certs/client.info certs/server-key.pem certs/ca-key.pem certs/server.info certs/README.md certs/selfsigned-cert.pem certs/selfsigned-key.pem
 cfg1:
 cfgmulti:
 cfgnew:
@@ -31,6 +31,7 @@ cfgsize:
 write:
 flush:
 integrity:
+replay:
 integrityhuge:
 dirconfig:
 list:
diff --git a/tests/run/replay-test.tr b/tests/run/replay-test.tr
new file mode 100644
index 0000000000000000000000000000000000000000..f9046c21500291911e61cc4e5d4f790d5a2ced3b
GIT binary patch
literal 116
zcmY#Qm@3S`z`$q=B7hhI1b`G1L%K`a3=khCrwUce0+t2IfPfhg3&7RF<e+Mqz)H{v
E025UQz5oCK

literal 0
HcmV?d00001

diff --git a/tests/run/simple_test b/tests/run/simple_test
index fe317f3..80dede8 100755
--- a/tests/run/simple_test
+++ b/tests/run/simple_test
@@ -16,6 +16,7 @@ tmpdir=`mktemp -d $TMPDIR/tmp.XXXXXX`
 conffile=${tmpdir}/nbd.conf
 pidfile=${tmpdir}/nbd.pid
 tmpnam=${tmpdir}/nbd.dd
+lognam=${tmpdir}/nbd.tr
 mydir=$(dirname $0)
 certdir=$($REALPATH ${mydir}/certs)
 cleanup="$2"
@@ -48,6 +49,21 @@ abort() {
 	kill -INT $$
 }
 
+replaycheck() {
+# $1: correct md5 value
+# $2: count
+	dd if=/dev/zero of=${tmpnam}-$2 bs=1024 count=4096 >/dev/null 2>&1
+	../../nbd-trplay -i ${tmpnam}-$2 -l $lognam -m $2 -b 512 > /dev/null
+	sol=$(md5sum < ${tmpnam}-$2)
+	if [ "$sol" = "$1  -" ];
+	then
+		return 0
+	else
+		echo "mismatch with count $2: expected $1, got $sol"
+		return 1
+	fi
+}
+
 trap -- cleanup EXIT
 trap -- abort INT
 
@@ -247,6 +263,55 @@ EOF
 		./nbd-tester-client -N export1 -i -t ${mydir}/integrityhuge-test.tr localhost
 		retval=$?
 	;;
+
+	*/replay)
+		# Check replay app
+		cat >${conffile} <<EOF
+[generic]
+[export1]
+	exportname = $tmpnam
+	flush = true
+	fua = true
+	transactionlog = $lognam
+	datalog = true
+	flush = true
+	fua = true
+	rotational = true
+	filesize = 52428800
+	temporary = true
+EOF
+		../../nbd-server -C ${conffile} -p ${pidfile} &
+		PID=$!
+		sleep $DELAY
+		./nbd-tester-client -N export1 -i -t ${mydir}/replay-test.tr localhost
+		retval=$?
+		if [ $retval -eq 0 ]
+		then
+			replaycheck 65135e9511b4c519a0474e4543d52dc2  1
+			retval=$?
+		fi
+		if [ $retval -eq 0 ]
+		then
+			replaycheck c571c5b1c190e68d0bcd8bce8861ad1b  3
+			retval=$?
+		fi
+		if [ $retval -eq 0 ]
+		then
+			replaycheck fd3065799a842ce227125f3a2282bf79  5
+			retval=$?
+		fi
+		if [ $retval -eq 0 ]
+		then
+			replaycheck f74123f1b41113b9fec915039e09ce66  9
+			retval=$?
+		fi
+		if [ $retval -eq 0 ]
+		then
+			replaycheck f74123f1b41113b9fec915039e09ce66  10
+			retval=$?
+		fi
+	;;
+
 	*/list)
 		# List exports
 		# This only works if we built nbd-client, which only exists on
-- 
2.35.1

