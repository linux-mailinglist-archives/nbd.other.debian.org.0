Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 60856710D08
	for <lists+nbd@lfdr.de>; Thu, 25 May 2023 15:13:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1A1C72053F; Thu, 25 May 2023 13:13:06 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu May 25 13:13:06 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 112D52050B
	for <lists-other-nbd@bendel.debian.org>; Thu, 25 May 2023 13:12:53 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.251 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.161,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 1-Ft1ChL_Mvw for <lists-other-nbd@bendel.debian.org>;
	Thu, 25 May 2023 13:12:48 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id C059520507
	for <nbd@other.debian.org>; Thu, 25 May 2023 13:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685020362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KTc6xEaZZqDJw2xsLoJvdlY7uty8sh1+3RVjkgxfOqE=;
	b=Qsap7+B1n/O5nGtxAVv4gQ+23W4ePgdhYmDYgD3x4Y8slC4QwjPK4QqS4HRLlzL4Y2aVyh
	lwMBKHXrNeykb3m4uyYux/m0DEpyPszevFtWFc1FlWoXavbFJ3aLX6m+94pPQratoLdCYr
	8P6vP0JScwUkHCDvtsiwwRVqrC+J+4k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-290-wObSPTeKNiiecCqXMvZllg-1; Thu, 25 May 2023 09:01:18 -0400
X-MC-Unique: wObSPTeKNiiecCqXMvZllg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F69A382C96D;
	Thu, 25 May 2023 13:01:14 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0DEEC492B0A;
	Thu, 25 May 2023 13:01:13 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-block@nongnu.org,
	nbd@other.debian.org
Subject: [libnbd PATCH v3 11/22] api: Add several functions for controlling extended headers
Date: Thu, 25 May 2023 08:00:57 -0500
Message-Id: <20230525130108.757242-12-eblake@redhat.com>
In-Reply-To: <20230525130108.757242-1-eblake@redhat.com>
References: <20230525130108.757242-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <vHFSXcO69KK.A.Kw.i71bkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2500
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230525130108.757242-12-eblake@redhat.com
Resent-Date: Thu, 25 May 2023 13:13:06 +0000 (UTC)

The new NBD_OPT_EXTENDED_HEADERS feature is worth using by default,
but there may be cases where the user explicitly wants to stick with
the older 32-bit headers.  nbd_set_request_extended_headers() will let
the client override the default, nbd_get_request_extended_headers()
determines the current state of the request, and
nbd_get_extended_headers_negotiated() determines what the client and
server actually settled on.  These use
nbd_set_request_structured_replies() and friends as a template.

Note that this patch just adds the API for controlling the defaults,
but ignores the state variable; a later one will then tweak the state
machine to actually request structured headers when the state variable
is set, as well as add nbd_opt_extended_headers() for manual control.

The intent is that because extended headers takes priority over
structured replies, the functions will interact as follows during the
automatic handshaking that takes place prior to nbd_opt_set_mode()
relinquishing control to the client in negotiation mode:

1. client default: request_eh=1, request_sr=1
 => try EXTENDED_HEADERS
    - server supports it: nothing further to do, use extended headers,
      but also report structured replies as active
    - server lacks it: behave like case 2
2. request_eh=0 (explicit client downgrade), request_sr=1 (left at default)
 => try STRUCTURED_REPLY
    - server supports it: expect structured replies
    - server lacks it: expect simple replies
3. request_sr=0 (explicit client downgrade), request_eh ignored
 => don't try either handshake
    - expect simple replies

Client code that wants to manually force simple replies only has to
disable structured replies; and only code that wants to disable
extended headers but still use structured replies has to use the new
nbd_set_request_extended_headers() API.  Until a later patch adds an
explicit API nbd_opt_extended_headers(), there is no way to request
extended headers after structured replies are already negotiated.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 lib/internal.h                                |   1 +
 generator/API.ml                              | 115 ++++++++++++++++--
 generator/states-newstyle-opt-starttls.c      |   1 +
 .../states-newstyle-opt-structured-reply.c    |   3 +-
 lib/handle.c                                  |  23 ++++
 python/t/110-defaults.py                      |   1 +
 python/t/120-set-non-defaults.py              |   2 +
 ocaml/tests/test_110_defaults.ml              |   2 +
 ocaml/tests/test_120_set_non_defaults.ml      |   3 +
 golang/libnbd_110_defaults_test.go            |   8 ++
 golang/libnbd_120_set_non_defaults_test.go    |  12 ++
 11 files changed, 160 insertions(+), 11 deletions(-)

diff --git a/lib/internal.h b/lib/internal.h
index e5423245..2948b77b 100644
--- a/lib/internal.h
+++ b/lib/internal.h
@@ -111,6 +111,7 @@ struct nbd_handle {
   char *tls_psk_file;           /* PSK filename, NULL = no PSK */

   /* Extended headers. */
+  bool request_eh;              /* Whether to request extended headers */
   bool extended_headers;        /* If we negotiated NBD_OPT_EXTENDED_HEADERS */

   /* Desired metadata contexts. */
diff --git a/generator/API.ml b/generator/API.ml
index f04f4b79..7616990a 100644
--- a/generator/API.ml
+++ b/generator/API.ml
@@ -808,6 +808,77 @@   "get_tls_psk_file", {
   };
 *)

+  "set_request_extended_headers", {
+    default_call with
+    args = [Bool "request"]; ret = RErr;
+    permitted_states = [ Created ];
+    shortdesc = "control use of extended headers";
+    longdesc = "\
+By default, libnbd tries to negotiate extended headers with the
+server, as this protocol extension permits the use of 64-bit
+zero, trim, and block status actions.  However,
+for integration testing, it can be useful to clear this flag
+rather than find a way to alter the server to fail the negotiation
+request.
+
+For backwards compatibility, the setting of this knob is ignored
+if L<nbd_set_request_structured_replies(3)> is also set to false,
+since the use of extended headers implies structured replies.";
+    see_also = [Link "get_request_extended_headers";
+                Link "set_handshake_flags"; Link "set_strict_mode";
+                Link "get_extended_headers_negotiated";
+                Link "zero"; Link "trim"; Link "cache";
+                Link "block_status_64";
+                Link "set_request_structured_replies"];
+  };
+
+  "get_request_extended_headers", {
+    default_call with
+    args = []; ret = RBool;
+    may_set_error = false;
+    shortdesc = "see if extended headers are attempted";
+    longdesc = "\
+Return the state of the request extended headers flag on this
+handle.
+
+B<Note:> If you want to find out if extended headers were actually
+negotiated on a particular connection use
+L<nbd_get_extended_headers_negotiated(3)> instead.";
+    see_also = [Link "set_request_extended_headers";
+                Link "get_extended_headers_negotiated";
+                Link "get_request_extended_headers"];
+  };
+
+  "get_extended_headers_negotiated", {
+    default_call with
+    args = []; ret = RBool;
+    permitted_states = [ Negotiating; Connected; Closed ];
+    shortdesc = "see if extended headers are in use";
+    longdesc = "\
+After connecting you may call this to find out if the connection is
+using extended headers.
+
+When extended headers are not in use, commands are limited to a
+32-bit length, even when the libnbd API uses a 64-bit parameter
+to express the length.  But even when extended headers are
+supported, the server may enforce other limits, visible through
+L<nbd_get_block_size(3)>.
+
+Note that when extended headers are negotiated, you should
+prefer the use of L<nbd_block_status_64(3)> instead of
+L<nbd_block_status(3)> if any of the meta contexts you requested
+via L<nbd_add_meta_context(3)> might return 64-bit status
+values; however, all of the well-known meta contexts covered
+by current C<LIBNBD_CONTEXT_*> constants only return 32-bit
+status.";
+    see_also = [Link "set_request_extended_headers";
+                Link "get_request_extended_headers";
+                Link "zero"; Link "trim"; Link "cache";
+                Link "block_status_64"; Link "get_block_size";
+                Link "get_protocol";
+                Link "get_structured_replies_negotiated"];
+  };
+
   "set_request_structured_replies", {
     default_call with
     args = [Bool "request"]; ret = RErr;
@@ -821,12 +892,16 @@   "set_request_structured_replies", {
 rather than find a way to alter the server to fail the negotiation
 request.  It is also useful to set this to false prior to using
 L<nbd_set_opt_mode(3)> if it is desired to control when to send
-L<nbd_opt_structured_reply(3)> during negotiation.";
+L<nbd_opt_structured_reply(3)> during negotiation.
+
+Note that setting this knob to false also disables any automatic
+request for extended headers.";
     see_also = [Link "get_request_structured_replies";
                 Link "set_handshake_flags"; Link "set_strict_mode";
                 Link "opt_structured_reply";
                 Link "get_structured_replies_negotiated";
-                Link "can_meta_context"; Link "can_df"];
+                Link "can_meta_context"; Link "can_df";
+                Link "set_request_extended_headers"];
   };

   "get_request_structured_replies", {
@@ -842,7 +917,8 @@   "get_request_structured_replies", {
 negotiated on a particular connection use
 L<nbd_get_structured_replies_negotiated(3)> instead.";
     see_also = [Link "set_request_structured_replies";
-                Link "get_structured_replies_negotiated"];
+                Link "get_structured_replies_negotiated";
+                Link "get_request_extended_headers"];
   };

   "get_structured_replies_negotiated", {
@@ -854,11 +930,17 @@   "get_structured_replies_negotiated", {
 After connecting you may call this to find out if the connection is
 using structured replies.  Note that this setting is sticky; this
 can return true even after a second L<nbd_opt_structured_reply(3)>
-returns false because the server detected a duplicate request.";
+returns false because the server detected a duplicate request.
+
+Note that if the connection negotiates extended headers, this
+function returns true (as extended headers imply structured
+replies) even if no explicit request for structured replies was
+attempted.";
     see_also = [Link "set_request_structured_replies";
                 Link "get_request_structured_replies";
                 Link "opt_structured_reply";
-                Link "get_protocol"];
+                Link "get_protocol";
+                Link "get_extended_headers_negotiated"];
   };

   "set_request_meta_context", {
@@ -2623,7 +2705,9 @@   "trim", {
 or there is an error.  Note this will generally return an error
 if L<nbd_can_trim(3)> is false or L<nbd_is_read_only(3)> is true.

-Note that not all servers can support a C<count> of 4GiB or larger.
+Note that not all servers can support a C<count> of 4GiB or larger;
+L<nbd_get_extended_headers_negotiated(3)> indicates which servers
+will parse a request larger than 32 bits.
 The NBD protocol does not yet have a way for a client to learn if
 the server will enforce an even smaller maximum trim size, although
 a future extension may add a constraint visible in
@@ -2654,7 +2738,9 @@   "cache", {
 this command.  Note this will generally return an error if
 L<nbd_can_cache(3)> is false.

-Note that not all servers can support a C<count> of 4GiB or larger.
+Note that not all servers can support a C<count> of 4GiB or larger;
+L<nbd_get_extended_headers_negotiated(3)> indicates which servers
+will parse a request larger than 32 bits.
 The NBD protocol does not yet have a way for a client to learn if
 the server will enforce an even smaller maximum cache size, although
 a future extension may add a constraint visible in
@@ -2683,7 +2769,9 @@   "zero", {
 or there is an error.  Note this will generally return an error if
 L<nbd_can_zero(3)> is false or L<nbd_is_read_only(3)> is true.

-Note that not all servers can support a C<count> of 4GiB or larger.
+Note that not all servers can support a C<count> of 4GiB or larger;
+L<nbd_get_extended_headers_negotiated(3)> indicates which servers
+will parse a request larger than 32 bits.
 The NBD protocol does not yet have a way for a client to learn if
 the server will enforce an even smaller maximum zero size, although
 a future extension may add a constraint visible in
@@ -2723,7 +2811,9 @@   "block_status", {
 are supported, the number of blocks and cumulative length
 of those blocks need not be identical between contexts.

-Note that not all servers can support a C<count> of 4GiB or larger.
+Note that not all servers can support a C<count> of 4GiB or larger;
+L<nbd_get_extended_headers_negotiated(3)> indicates which servers
+will parse a request larger than 32 bits.
 The NBD protocol does not yet have a way for a client to learn if
 the server will enforce an even smaller maximum block status size,
 although a future extension may add a constraint visible in
@@ -2801,7 +2891,9 @@   "block_status_64", {
 are supported, the number of blocks and cumulative length
 of those blocks need not be identical between contexts.

-Note that not all servers can support a C<count> of 4GiB or larger.
+Note that not all servers can support a C<count> of 4GiB or larger;
+L<nbd_get_extended_headers_negotiated(3)> indicates which servers
+will parse a request larger than 32 bits.
 The NBD protocol does not yet have a way for a client to learn if
 the server will enforce an even smaller maximum block status size,
 although a future extension may add a constraint visible in
@@ -4024,6 +4116,9 @@ let first_version =
   (* Added in 1.17.x development cycle, will be stable and supported in 1.18. *)
   "block_status_64", (1, 18);
   "aio_block_status_64", (1, 18);
+  "set_request_extended_headers", (1, 18);
+  "get_request_extended_headers", (1, 18);
+  "get_extended_headers_negotiated", (1, 18);

   (* These calls are proposed for a future version of libnbd, but
    * have not been added to any released version so far.
diff --git a/generator/states-newstyle-opt-starttls.c b/generator/states-newstyle-opt-starttls.c
index 700604dd..e497548c 100644
--- a/generator/states-newstyle-opt-starttls.c
+++ b/generator/states-newstyle-opt-starttls.c
@@ -86,6 +86,7 @@  NEWSTYLE.OPT_STARTTLS.CHECK_REPLY:
     }
     nbd_internal_reset_size_and_flags (h);
     h->structured_replies = false;
+    h->extended_headers = false;
     h->meta_valid = false;
     new_sock = nbd_internal_crypto_create_session (h, h->sock);
     if (new_sock == NULL) {
diff --git a/generator/states-newstyle-opt-structured-reply.c b/generator/states-newstyle-opt-structured-reply.c
index 18245054..bb94b70a 100644
--- a/generator/states-newstyle-opt-structured-reply.c
+++ b/generator/states-newstyle-opt-structured-reply.c
@@ -25,7 +25,7 @@  NEWSTYLE.OPT_STRUCTURED_REPLY.START:
     assert (h->opt_mode);
   else {
     assert (CALLBACK_IS_NULL (h->opt_cb.completion));
-    if (!h->request_sr) {
+    if (!h->request_sr || h->structured_replies) {
       if (h->opt_mode)
         SET_NEXT_STATE (%.NEGOTIATING);
       else
@@ -84,6 +84,7 @@  NEWSTYLE.OPT_STRUCTURED_REPLY.CHECK_REPLY:
     err = 0;
     break;
   case NBD_REP_ERR_INVALID:
+  case NBD_REP_ERR_EXT_HEADER_REQD:
     err = EINVAL;
     /* fallthrough */
   default:
diff --git a/lib/handle.c b/lib/handle.c
index fba6d1c4..71034835 100644
--- a/lib/handle.c
+++ b/lib/handle.c
@@ -64,6 +64,7 @@ nbd_create (void)

   h->unique = 1;
   h->tls_verify_peer = true;
+  h->request_eh = true;
   h->request_sr = true;
   h->request_meta = true;
   h->request_block_size = true;
@@ -436,6 +437,28 @@ nbd_unlocked_clear_meta_contexts (struct nbd_handle *h)
   return 0;
 }

+
+int
+nbd_unlocked_set_request_extended_headers (struct nbd_handle *h,
+                                           bool request)
+{
+  h->request_eh = request;
+  return 0;
+}
+
+/* NB: may_set_error = false. */
+int
+nbd_unlocked_get_request_extended_headers (struct nbd_handle *h)
+{
+  return h->request_eh;
+}
+
+int
+nbd_unlocked_get_extended_headers_negotiated (struct nbd_handle *h)
+{
+  return h->extended_headers;
+}
+
 int
 nbd_unlocked_set_request_structured_replies (struct nbd_handle *h,
                                              bool request)
diff --git a/python/t/110-defaults.py b/python/t/110-defaults.py
index ed60b786..2e59bf39 100644
--- a/python/t/110-defaults.py
+++ b/python/t/110-defaults.py
@@ -21,6 +21,7 @@
 assert h.get_export_name() == ""
 assert h.get_full_info() is False
 assert h.get_tls() == nbd.TLS_DISABLE
+assert h.get_request_extended_headers() is True
 assert h.get_request_structured_replies() is True
 assert h.get_request_meta_context() is True
 assert h.get_request_block_size() is True
diff --git a/python/t/120-set-non-defaults.py b/python/t/120-set-non-defaults.py
index a2fafe0c..3320f8cf 100644
--- a/python/t/120-set-non-defaults.py
+++ b/python/t/120-set-non-defaults.py
@@ -31,6 +31,8 @@
 if h.supports_tls():
     h.set_tls(nbd.TLS_ALLOW)
     assert h.get_tls() == nbd.TLS_ALLOW
+h.set_request_extended_headers(False)
+assert h.get_request_extended_headers() is False
 h.set_request_structured_replies(False)
 assert h.get_request_structured_replies() is False
 h.set_request_meta_context(False)
diff --git a/ocaml/tests/test_110_defaults.ml b/ocaml/tests/test_110_defaults.ml
index b95cd1f0..d7b0463f 100644
--- a/ocaml/tests/test_110_defaults.ml
+++ b/ocaml/tests/test_110_defaults.ml
@@ -26,6 +26,8 @@ let
       assert (not info);
       let tls = NBD.get_tls nbd in
       assert (tls = NBD.TLS.DISABLE);
+      let eh = NBD.get_request_extended_headers nbd in
+      assert (eh = true);
       let sr = NBD.get_request_structured_replies nbd in
       assert sr;
       let meta = NBD.get_request_meta_context nbd in
diff --git a/ocaml/tests/test_120_set_non_defaults.ml b/ocaml/tests/test_120_set_non_defaults.ml
index 478a88f3..4f5c2eb5 100644
--- a/ocaml/tests/test_120_set_non_defaults.ml
+++ b/ocaml/tests/test_120_set_non_defaults.ml
@@ -39,6 +39,9 @@ let
         let tls = NBD.get_tls nbd in
         assert (tls = NBD.TLS.ALLOW);
       );
+      NBD.set_request_extended_headers nbd false;
+      let eh = NBD.get_request_extended_headers nbd in
+      assert (eh = false);
       NBD.set_request_structured_replies nbd false;
       let sr = NBD.get_request_structured_replies nbd in
       assert (not sr);
diff --git a/golang/libnbd_110_defaults_test.go b/golang/libnbd_110_defaults_test.go
index 119cb7ca..510baa39 100644
--- a/golang/libnbd_110_defaults_test.go
+++ b/golang/libnbd_110_defaults_test.go
@@ -51,6 +51,14 @@ func Test110Defaults(t *testing.T) {
 		t.Fatalf("unexpected tls state")
 	}

+	eh, err := h.GetRequestExtendedHeaders()
+	if err != nil {
+		t.Fatalf("could not get extended headers state: %s", err)
+	}
+	if eh != true {
+		t.Fatalf("unexpected extended headers state")
+	}
+
 	sr, err := h.GetRequestStructuredReplies()
 	if err != nil {
 		t.Fatalf("could not get structured replies state: %s", err)
diff --git a/golang/libnbd_120_set_non_defaults_test.go b/golang/libnbd_120_set_non_defaults_test.go
index b096c4f6..4c6bb3ce 100644
--- a/golang/libnbd_120_set_non_defaults_test.go
+++ b/golang/libnbd_120_set_non_defaults_test.go
@@ -81,6 +81,18 @@ func Test120SetNonDefaults(t *testing.T) {
 		}
 	}

+	err = h.SetRequestExtendedHeaders(false)
+	if err != nil {
+		t.Fatalf("could not set extended headers state: %s", err)
+	}
+	eh, err := h.GetRequestExtendedHeaders()
+	if err != nil {
+		t.Fatalf("could not get extended headers state: %s", err)
+	}
+	if eh != false {
+		t.Fatalf("unexpected extended headers state")
+	}
+
 	err = h.SetRequestStructuredReplies(false)
 	if err != nil {
 		t.Fatalf("could not set structured replies state: %s", err)
-- 
2.40.1

