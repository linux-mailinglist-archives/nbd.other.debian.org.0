Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FC74D107D
	for <lists+nbd@lfdr.de>; Tue,  8 Mar 2022 07:50:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id DD10A2029E; Tue,  8 Mar 2022 06:50:15 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Mar  8 06:50:15 2022
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
	by bendel.debian.org (Postfix) with ESMTP id C44E120280
	for <lists-other-nbd@bendel.debian.org>; Tue,  8 Mar 2022 06:49:59 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.37 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, FOURLA=0.1, FVGT_m_MULTI_ODD=0.02, LDO_WHITELIST=-5,
	MD5_SHA1_SUM=-1, MONEY=0.5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, STOCKLIKE=1, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Wk4arR6LzLCg for <lists-other-nbd@bendel.debian.org>;
	Tue,  8 Mar 2022 06:49:54 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 986182029B
	for <nbd@other.debian.org>; Tue,  8 Mar 2022 06:49:54 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id q20so8189705wmq.1
        for <nbd@other.debian.org>; Mon, 07 Mar 2022 22:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorfullife-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rTVrIBnkkdLTmD9R1OyqYBm1kL7AuJWHCwQIvW82yag=;
        b=dBn4kCxr+1A3hsujpiVwF7EE5H2cqQW2PegvTACJBaemLE0ZkSVegRa+O93ZH3XLUv
         XdHbvQrYzJx6R3Rs2/wSMXqRroHWhWjqPXjbb7UYn4fSN5w8oF/hy/EP8WvjaHGFCoAr
         CqoT4K3ihCEJDrYAjmZWmHO0SusJlpMsLHwuY0zYNzgdXBQTH8G83twICyefNnXk7f1Q
         thbXNf+3Lg6LrAUBLVGc0LiLpSqD78hKGnvWsAteH6By0JU8/rVTTkDdq39VgTmAYsxQ
         LX97yCO3YNVJqycZpBRfnc5fxInMy+GIJA1t2iG+3atG/R697jZYViqZCV1UBa0J7HVl
         Y7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rTVrIBnkkdLTmD9R1OyqYBm1kL7AuJWHCwQIvW82yag=;
        b=o2+56izvcofFHoE/Qxn0KTHBo1RaOPBgtSRoKDWP0eagYnrniGqGn2OWKRXhlbxFW1
         vncafX8WCmCw+eGF8C31af4L2STVQEqGurZQ83jN2NsUIewuF7H0SgQvUewFYbOetb2R
         V2fI99Al1hvv6TjEawCDlVTwbXtbcdB48I+2VGVKGzZL/fr/4AzUlBeDG66JO+MxXoGv
         NfBKTafgl1iOnofsgWibkbkSWQ+4PUs4hmB69M7ykYTukNUufr106W+JJlBnfMK7r97t
         QoJbxRSlJQLHBWlqAzr2q89Av/dCNlIdywElg4lE6QQ1psGFxbAK6h037e3RpdbZnHGd
         NMTQ==
X-Gm-Message-State: AOAM530wyhQIv+8U1yKJKzjvjFR8FUliCgBVOAMAS+Mzphf5K2T6wYhf
	sHQEXXbWluc0hvMoYbqjeC1TaEoBRJu9og==
X-Google-Smtp-Source: ABdhPJxtXr0ykuAY0Uc/JEjK8ero5JK/2evs3T12K3qcaiAY5aLgwCD7adWMHCl7h5+Jdj4MAtnQBw==
X-Received: by 2002:a1c:4c13:0:b0:389:a4ab:df7c with SMTP id z19-20020a1c4c13000000b00389a4abdf7cmr2195708wmf.14.1646722192101;
        Mon, 07 Mar 2022 22:49:52 -0800 (PST)
Received: from localhost.localdomain (p200300d997090400ceff79f607526619.dip0.t-ipconnect.de. [2003:d9:9709:400:ceff:79f6:752:6619])
        by smtp.googlemail.com with ESMTPSA id f4-20020a5d4dc4000000b001d8e67e5214sm13092364wru.48.2022.03.07.22.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 22:49:51 -0800 (PST)
From: Manfred Spraul <manfred@colorfullife.com>
To: nbd@other.debian.org
Cc: Wouter Verhelst <w@uter.be>,
	Manfred Spraul <manfred@colorfullife.com>,
	Manfred Spraul <manfred.spraul@de.bosch.com>
Subject: [PATCH 2/2] nbd-trplay: Add test case
Date: Tue,  8 Mar 2022 07:49:44 +0100
Message-Id: <20220308064944.12439-3-manfred@colorfullife.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308064944.12439-1-manfred@colorfullife.com>
References: <20220308064944.12439-1-manfred@colorfullife.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <rWqOZvUph8F.A.xCH.nyvJiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1729
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220308064944.12439-3-manfred@colorfullife.com
Resent-Date: Tue,  8 Mar 2022 06:50:15 +0000 (UTC)

Add a short test case for nbd-trplay

Signed-off-by: Manfred Spraul <manfred.spraul@de.bosch.com>
---
 tests/run/Makefile.am    |   5 +--
 tests/run/replay-test.tr | Bin 0 -> 116 bytes
 tests/run/simple_test    |  65 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 68 insertions(+), 2 deletions(-)
 create mode 100644 tests/run/replay-test.tr

diff --git a/tests/run/Makefile.am b/tests/run/Makefile.am
index f41eb8d..4c2f635 100644
--- a/tests/run/Makefile.am
+++ b/tests/run/Makefile.am
@@ -4,7 +4,7 @@ else
 TLSSRC =
 endif
 TESTS_ENVIRONMENT=$(srcdir)/simple_test
-TESTS = cfg1 cfgmulti cfgnew cfgsize write flush integrity dirconfig list inetd \
+TESTS = cfg1 cfgmulti cfgnew cfgsize write flush integrity replay dirconfig list inetd \
 	rowrite tree rotree unix integrityhuge handshake tls tlswrongcert tlshuge
 XFAIL_TESTS=@RUN_XFAIL@
 check_PROGRAMS = nbd-tester-client
@@ -19,7 +19,7 @@ nbd_tester_client_CFLAGS += @GnuTLS_CFLAGS@
 nbd_tester_client_LDADD += @GnuTLS_LIBS@
 endif
 CLEANFILES = buffer.c crypto-gnutls.c cliserv.c
-EXTRA_DIST = integrity-test.tr integrityhuge-test.tr simple_test certs/client-key.pem certs/client-cert.pem certs/server-cert.pem certs/ca-cert.pem certs/ca.info certs/client.info certs/server-key.pem certs/ca-key.pem certs/server.info certs/README.md certs/selfsigned-cert.pem certs/selfsigned-key.pem
+EXTRA_DIST = integrity-test.tr integrityhuge-test.tr replay-test.tr simple_test certs/client-key.pem certs/client-cert.pem certs/server-cert.pem certs/ca-cert.pem certs/ca.info certs/client.info certs/server-key.pem certs/ca-key.pem certs/server.info certs/README.md certs/selfsigned-cert.pem certs/selfsigned-key.pem
 cfg1:
 cfgmulti:
 cfgnew:
@@ -27,6 +27,7 @@ cfgsize:
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

