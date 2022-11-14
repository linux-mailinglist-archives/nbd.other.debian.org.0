Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 8798A628C93
	for <lists+nbd@lfdr.de>; Tue, 15 Nov 2022 00:00:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 696CF20668; Mon, 14 Nov 2022 23:00:06 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Nov 14 23:00:06 2022
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2 autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C876920680
	for <lists-other-nbd@bendel.debian.org>; Mon, 14 Nov 2022 22:58:46 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.696 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.515,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id JAEzKVNOMjfh for <lists-other-nbd@bendel.debian.org>;
	Mon, 14 Nov 2022 22:58:32 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 8D6BC20616
	for <nbd@other.debian.org>; Mon, 14 Nov 2022 22:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668466707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dn4u5c7k0NDmH+fmkZZ9nPfDWOXKvhaM7RFY3LonV6A=;
	b=FlM0w5WkJoqeAtqA/oFO9e0BIVqzs5lyesr4C0fudhcrH2ejS8eYsrpwEo9hKsy/KwTA2F
	r7ZG5Zo7HVrTMz9E0y99zXt1Rb3hKll+ceWZGQIaWXWdXWXob4qiC1u+tJQNCBVPx9uZMs
	mL4eKP7vJBTvEr8WIYGXGmUrCiKSEY0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-383-eKppC75POrCF_C0b4JsMYg-1; Mon, 14 Nov 2022 17:52:10 -0500
X-MC-Unique: eKppC75POrCF_C0b4JsMYg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA35F858F13;
	Mon, 14 Nov 2022 22:52:09 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 84FCF40E9786;
	Mon, 14 Nov 2022 22:52:09 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	nbd@other.debian.org
Subject: [libnbd PATCH v2 14/23] info: Expose extended-headers support through nbdinfo
Date: Mon, 14 Nov 2022 16:51:49 -0600
Message-Id: <20221114225158.2186742-15-eblake@redhat.com>
In-Reply-To: <20221114225158.2186742-1-eblake@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114225158.2186742-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ZUwEvhEa9DK.A.ORC.2hscjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2263
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20221114225158.2186742-15-eblake@redhat.com
Resent-Date: Mon, 14 Nov 2022 23:00:06 +0000 (UTC)

Add another bit of overall server information, as well as a '--can
extended-headers' silent query.  For now, the testsuite is written
assuming that when nbdkit finally adds extended headers support, it
will also add a --no-eh kill switch comparable to its existing --no-sr
switch.
---
 info/nbdinfo.pod     | 11 ++++++++++-
 info/can.c           |  9 +++++++++
 info/info-can.sh     | 27 +++++++++++++++++++++++++++
 info/info-packets.sh | 17 ++++++++++++++++-
 info/main.c          |  7 ++++++-
 5 files changed, 68 insertions(+), 3 deletions(-)

diff --git a/info/nbdinfo.pod b/info/nbdinfo.pod
index c47e5175..2455e1c0 100644
--- a/info/nbdinfo.pod
+++ b/info/nbdinfo.pod
@@ -86,6 +86,7 @@ the I<--json> parameter:
    "protocol": "newstyle-fixed",
    "TLS": false,
    "structured": true,
+   "extended": false,
    "exports": [
      {
        "export-name": "",
@@ -165,6 +166,11 @@ Test if the NBD URI connection is using TLS.
 Test if server can respond with structured replies (a prerequisite
 for supporting block status commands).

+=item nbdinfo --can extended-headers URI
+
+Test if server supports extended headers (a prerequisite for
+supporting 64-bit commands; implies structured replies as well).
+
 =item nbdinfo --is rotational URI

 Test if the server export is backed by something which behaves like a
@@ -312,6 +318,8 @@ Display brief command line help and exit.

 =item B<--can df>

+=item B<--can extended-headers>
+
 =item B<--can fast-zero>

 =item B<--can flush>
@@ -341,7 +349,8 @@ and the following libnbd functions: L<nbd_can_cache(3)>,
 L<nbd_can_df(3)>, L<nbd_can_fast_zero(3)>, L<nbd_can_flush(3)>,
 L<nbd_can_fua(3)>, L<nbd_can_multi_conn(3)>, L<nbd_can_trim(3)>,
 L<nbd_can_zero(3)>, L<nbd_is_read_only(3)>,
-L<nbd_get_structured_replies_negotiated(3)>.
+L<nbd_get_structured_replies_negotiated(3)>,
+L<nbd_get_extended_headers_negotiated(3)>.

 =item B<--color>

diff --git a/info/can.c b/info/can.c
index 08d6bcd5..f602ffce 100644
--- a/info/can.c
+++ b/info/can.c
@@ -50,6 +50,15 @@ do_can (void)
            strcasecmp (can, "structured_replies") == 0)
     feature = nbd_get_structured_replies_negotiated (nbd);

+  else if (strcasecmp (can, "eh") == 0 ||
+           strcasecmp (can, "extended header") == 0 ||
+           strcasecmp (can, "extended-header") == 0 ||
+           strcasecmp (can, "extended_header") == 0 ||
+           strcasecmp (can, "extended headers") == 0 ||
+           strcasecmp (can, "extended-headers") == 0 ||
+           strcasecmp (can, "extended_headers") == 0)
+    feature = nbd_get_extended_headers_negotiated (nbd);
+
   else if (strcasecmp (can, "readonly") == 0 ||
            strcasecmp (can, "read-only") == 0 ||
            strcasecmp (can, "read_only") == 0)
diff --git a/info/info-can.sh b/info/info-can.sh
index 3edc3948..e5f6a44b 100755
--- a/info/info-can.sh
+++ b/info/info-can.sh
@@ -61,6 +61,33 @@ esac
 EOF
 test $st = 2

+# --can extended-headers cannot be positively tested until nbdkit gains
+# --no-eh support.  Otherwise, it is similar to --can structured-reply.
+
+no_eh=
+if nbdkit --no-eh --help >/dev/null 2>/dev/null; then
+    no_eh=--no-eh
+    nbdkit -v -U - sh - \
+           --run '$VG nbdinfo --can extended-headers "nbd+unix:///?socket=$unixsocket"' <<'EOF'
+case "$1" in
+  get_size) echo 1024 ;;
+  pread) ;;
+  *) exit 2 ;;
+esac
+EOF
+fi
+
+st=0
+nbdkit -v -U - $no_eh sh - \
+       --run '$VG nbdinfo --can extended-headers "nbd+unix:///?socket=$unixsocket"' <<'EOF' || st=$?
+case "$1" in
+  get_size) echo 1024 ;;
+  pread) ;;
+  *) exit 2 ;;
+esac
+EOF
+test $st = 2
+
 # --can cache and --can fua require special handling because in
 # nbdkit-sh-plugin we must print "native" or "none".  Also the can_fua
 # flag is only sent if the export is writable (hence can_write below).
diff --git a/info/info-packets.sh b/info/info-packets.sh
index 82bb526c..a6b307a0 100755
--- a/info/info-packets.sh
+++ b/info/info-packets.sh
@@ -27,12 +27,27 @@ requires nbdkit --no-sr memory --version
 out=info-packets.out
 cleanup_fn rm -f $out

+# Older nbdkit does not support extended headers; --no-eh is a reliable
+# witness of whether nbdkit is new enough.
+
+no_eh=
+if nbdkit --no-eh --help >/dev/null 2>/dev/null; then
+    no_eh=--no-eh
+fi
+
 nbdkit --no-sr -U - memory size=1M \
        --run '$VG nbdinfo "nbd+unix:///?socket=$unixsocket"' > $out
 cat $out
 grep "protocol: .*using simple packets" $out

-nbdkit -U - memory size=1M \
+nbdkit $no_eh -U - memory size=1M \
        --run '$VG nbdinfo "nbd+unix:///?socket=$unixsocket"' > $out
 cat $out
 grep "protocol: .*using structured packets" $out
+
+if test x != "x$no_eh"; then
+    nbdkit -U - memory size=1M \
+           --run '$VG nbdinfo "nbd+unix:///?socket=$unixsocket"' > $out
+    cat $out
+    grep "protocol: .*using extended packets" $out
+fi
diff --git a/info/main.c b/info/main.c
index 5cd91fe1..9794c109 100644
--- a/info/main.c
+++ b/info/main.c
@@ -302,11 +302,13 @@ main (int argc, char *argv[])
     const char *protocol;
     int tls_negotiated;
     int sr_negotiated;
+    int eh_negotiated;

     /* Print per-connection fields. */
     protocol = nbd_get_protocol (nbd);
     tls_negotiated = nbd_get_tls_negotiated (nbd);
     sr_negotiated = nbd_get_structured_replies_negotiated (nbd);
+    eh_negotiated = nbd_get_extended_headers_negotiated (nbd);

     if (!json_output) {
       if (protocol) {
@@ -314,8 +316,9 @@ main (int argc, char *argv[])
         fprintf (fp, "protocol: %s", protocol);
         if (tls_negotiated >= 0)
           fprintf (fp, " %s TLS", tls_negotiated ? "with" : "without");
-        if (sr_negotiated >= 0)
+        if (eh_negotiated >= 0 && sr_negotiated >= 0)
           fprintf (fp, ", using %s packets",
+                   eh_negotiated ? "extended" :
                    sr_negotiated ? "structured" : "simple");
         fprintf (fp, "\n");
         ansi_restore (fp);
@@ -333,6 +336,8 @@ main (int argc, char *argv[])
         fprintf (fp, "\"TLS\": %s,\n", tls_negotiated ? "true" : "false");
       if (sr_negotiated >= 0)
         fprintf (fp, "\"structured\": %s,\n", sr_negotiated ? "true" : "false");
+      if (eh_negotiated >= 0)
+        fprintf (fp, "\"extended\": %s,\n", eh_negotiated ? "true" : "false");
     }

     if (!list_all)
-- 
2.38.1

