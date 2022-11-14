Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4C4628D1E
	for <lists+nbd@lfdr.de>; Tue, 15 Nov 2022 00:05:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id F1F5720678; Mon, 14 Nov 2022 23:05:26 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Nov 14 23:05:26 2022
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,WORD_WITHOUT_VOWELS autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0FE622067A
	for <lists-other-nbd@bendel.debian.org>; Mon, 14 Nov 2022 23:04:39 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.596 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.515,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001, WORD_WITHOUT_VOWELS=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id hVkhXAXkN_X5 for <lists-other-nbd@bendel.debian.org>;
	Mon, 14 Nov 2022 23:04:33 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id ADAF120615
	for <nbd@other.debian.org>; Mon, 14 Nov 2022 23:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668467067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XyzxNnPOskLIUQT0IYlcm+4U9bzcrXQAt9wSC9NhVmI=;
	b=WO1wmrz7PjZkV9QM5PSMhewTW1sZ4KNMMqyCJjopTKebFVieh0cQPkMMp4cC7EU/w9dUXd
	06EuCe4PE9SzU6oBjMWtgCTx70Q6T5GKn5zNAqd3nhEI25f/5ooc06N9FSEpfXCiIcByCs
	aXZUJLokO992leGPv55VAQKUMgK90G0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-MElPXoAmM-2NVGbsZaveEQ-1; Mon, 14 Nov 2022 17:49:04 -0500
X-MC-Unique: MElPXoAmM-2NVGbsZaveEQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDF7B1C0878D;
	Mon, 14 Nov 2022 22:49:03 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 48CD140E42EF;
	Mon, 14 Nov 2022 22:49:03 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	libguestfs@redhat.com,
	nbd@other.debian.org,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH v2 12/15] nbd/server: Prepare for per-request filtering of BLOCK_STATUS
Date: Mon, 14 Nov 2022 16:48:45 -0600
Message-Id: <20221114224848.2186298-13-eblake@redhat.com>
In-Reply-To: <20221114224848.2186298-1-eblake@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114224848.2186298-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <1DMy7I63YuK.A.KCE.2mscjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2289
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20221114224848.2186298-13-eblake@redhat.com
Resent-Date: Mon, 14 Nov 2022 23:05:26 +0000 (UTC)

The next commit will add support for the new addition of
NBD_CMD_FLAG_PAYLOAD during NBD_CMD_BLOCK_STATUS, where the client can
request that the server only return a subset of negotiated contexts,
rather than all contexts.  To make that task easier, this patch
populates the list of contexts to return on a per-command basis (for
now, identical to the full set of negotiated contexts).

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 include/block/nbd.h |  20 +++++++-
 nbd/server.c        | 108 +++++++++++++++++++++++---------------------
 2 files changed, 75 insertions(+), 53 deletions(-)

diff --git a/include/block/nbd.h b/include/block/nbd.h
index 02e31b2261..9a8ac1c8a5 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -50,8 +50,23 @@ typedef struct NBDOptionReplyMetaContext {
     /* metadata context name follows */
 } QEMU_PACKED NBDOptionReplyMetaContext;

-/* Transmission phase structs
- *
+/* Transmission phase structs */
+
+/*
+ * NBDMetaContexts represents a list of meta contexts in use, as
+ * selected by NBD_OPT_SET_META_CONTEXT. Also used for
+ * NBD_OPT_LIST_META_CONTEXT, and payload filtering in
+ * NBD_CMD_BLOCK_STATUS.
+ */
+typedef struct NBDMetaContexts {
+    size_t count; /* number of negotiated contexts */
+    bool base_allocation; /* export base:allocation context (block status) */
+    bool allocation_depth; /* export qemu:allocation-depth */
+    size_t nr_bitmaps; /* Length of bitmaps array */
+    bool *bitmaps; /* export qemu:dirty-bitmap:<export bitmap name> */
+} NBDMetaContexts;
+
+/*
  * Note: NBDRequest is _NOT_ the same as the network representation of an NBD
  * request!
  */
@@ -61,6 +76,7 @@ typedef struct NBDRequest {
     uint64_t len;   /* Effect length; 32 bit limit without extended headers */
     uint16_t flags; /* NBD_CMD_FLAG_* */
     uint16_t type;  /* NBD_CMD_* */
+    NBDMetaContexts contexts; /* Used by NBD_CMD_BLOCK_STATUS */
 } NBDRequest;

 typedef struct NBDSimpleReply {
diff --git a/nbd/server.c b/nbd/server.c
index f21f8098c1..1fd1f32028 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -103,20 +103,6 @@ struct NBDExport {

 static QTAILQ_HEAD(, NBDExport) exports = QTAILQ_HEAD_INITIALIZER(exports);

-/* NBDExportMetaContexts represents a list of contexts to be exported,
- * as selected by NBD_OPT_SET_META_CONTEXT. Also used for
- * NBD_OPT_LIST_META_CONTEXT. */
-typedef struct NBDExportMetaContexts {
-    NBDExport *exp;
-    size_t count; /* number of negotiated contexts */
-    bool base_allocation; /* export base:allocation context (block status) */
-    bool allocation_depth; /* export qemu:allocation-depth */
-    bool *bitmaps; /*
-                    * export qemu:dirty-bitmap:<export bitmap name>,
-                    * sized by exp->nr_export_bitmaps
-                    */
-} NBDExportMetaContexts;
-
 struct NBDClient {
     int refcount;
     void (*close_fn)(NBDClient *client, bool negotiated);
@@ -143,7 +129,8 @@ struct NBDClient {

     bool structured_reply; /* also set true if extended_headers is set */
     bool extended_headers;
-    NBDExportMetaContexts export_meta;
+    NBDExport *context_exp; /* export of last OPT_SET_META_CONTEXT */
+    NBDMetaContexts contexts; /* Negotiated meta contexts */

     uint32_t opt; /* Current option being negotiated */
     uint32_t optlen; /* remaining length of data in ioc for the option being
@@ -456,8 +443,8 @@ static int nbd_negotiate_handle_list(NBDClient *client, Error **errp)

 static void nbd_check_meta_export(NBDClient *client)
 {
-    if (client->exp != client->export_meta.exp) {
-        client->export_meta.count = 0;
+    if (client->exp != client->context_exp) {
+        client->contexts.count = 0;
     }
 }

@@ -847,7 +834,7 @@ static bool nbd_strshift(const char **str, const char *prefix)
  * Handle queries to 'base' namespace. For now, only the base:allocation
  * context is available.  Return true if @query has been handled.
  */
-static bool nbd_meta_base_query(NBDClient *client, NBDExportMetaContexts *meta,
+static bool nbd_meta_base_query(NBDClient *client, NBDMetaContexts *meta,
                                 const char *query)
 {
     if (!nbd_strshift(&query, "base:")) {
@@ -867,8 +854,8 @@ static bool nbd_meta_base_query(NBDClient *client, NBDExportMetaContexts *meta,
  * and qemu:allocation-depth contexts are available.  Return true if @query
  * has been handled.
  */
-static bool nbd_meta_qemu_query(NBDClient *client, NBDExportMetaContexts *meta,
-                                const char *query)
+static bool nbd_meta_qemu_query(NBDClient *client, NBDExport *exp,
+                                NBDMetaContexts *meta, const char *query)
 {
     size_t i;

@@ -879,9 +866,9 @@ static bool nbd_meta_qemu_query(NBDClient *client, NBDExportMetaContexts *meta,

     if (!*query) {
         if (client->opt == NBD_OPT_LIST_META_CONTEXT) {
-            meta->allocation_depth = meta->exp->allocation_depth;
-            if (meta->exp->nr_export_bitmaps) {
-                memset(meta->bitmaps, 1, meta->exp->nr_export_bitmaps);
+            meta->allocation_depth = exp->allocation_depth;
+            if (meta->nr_bitmaps) {
+                memset(meta->bitmaps, 1, meta->nr_bitmaps);
             }
         }
         trace_nbd_negotiate_meta_query_parse("empty");
@@ -890,7 +877,7 @@ static bool nbd_meta_qemu_query(NBDClient *client, NBDExportMetaContexts *meta,

     if (strcmp(query, "allocation-depth") == 0) {
         trace_nbd_negotiate_meta_query_parse("allocation-depth");
-        meta->allocation_depth = meta->exp->allocation_depth;
+        meta->allocation_depth = exp->allocation_depth;
         return true;
     }

@@ -898,17 +885,17 @@ static bool nbd_meta_qemu_query(NBDClient *client, NBDExportMetaContexts *meta,
         trace_nbd_negotiate_meta_query_parse("dirty-bitmap:");
         if (!*query) {
             if (client->opt == NBD_OPT_LIST_META_CONTEXT &&
-                meta->exp->nr_export_bitmaps) {
-                memset(meta->bitmaps, 1, meta->exp->nr_export_bitmaps);
+                exp->nr_export_bitmaps) {
+                memset(meta->bitmaps, 1, exp->nr_export_bitmaps);
             }
             trace_nbd_negotiate_meta_query_parse("empty");
             return true;
         }

-        for (i = 0; i < meta->exp->nr_export_bitmaps; i++) {
+        for (i = 0; i < meta->nr_bitmaps; i++) {
             const char *bm_name;

-            bm_name = bdrv_dirty_bitmap_name(meta->exp->export_bitmaps[i]);
+            bm_name = bdrv_dirty_bitmap_name(exp->export_bitmaps[i]);
             if (strcmp(bm_name, query) == 0) {
                 meta->bitmaps[i] = true;
                 trace_nbd_negotiate_meta_query_parse(query);
@@ -932,8 +919,8 @@ static bool nbd_meta_qemu_query(NBDClient *client, NBDExportMetaContexts *meta,
  *
  * Return -errno on I/O error, 0 if option was completely handled by
  * sending a reply about inconsistent lengths, or 1 on success. */
-static int nbd_negotiate_meta_query(NBDClient *client,
-                                    NBDExportMetaContexts *meta, Error **errp)
+static int nbd_negotiate_meta_query(NBDClient *client, NBDExport *exp,
+                                    NBDMetaContexts *meta, Error **errp)
 {
     int ret;
     g_autofree char *query = NULL;
@@ -960,7 +947,7 @@ static int nbd_negotiate_meta_query(NBDClient *client,
     if (nbd_meta_base_query(client, meta, query)) {
         return 1;
     }
-    if (nbd_meta_qemu_query(client, meta, query)) {
+    if (nbd_meta_qemu_query(client, exp, meta, query)) {
         return 1;
     }

@@ -972,14 +959,15 @@ static int nbd_negotiate_meta_query(NBDClient *client,
  * Handle NBD_OPT_LIST_META_CONTEXT and NBD_OPT_SET_META_CONTEXT
  *
  * Return -errno on I/O error, or 0 if option was completely handled. */
-static int nbd_negotiate_meta_queries(NBDClient *client,
-                                      NBDExportMetaContexts *meta, Error **errp)
+static int nbd_negotiate_meta_queries(NBDClient *client, Error **errp)
 {
     int ret;
     g_autofree char *export_name = NULL;
     /* Mark unused to work around https://bugs.llvm.org/show_bug.cgi?id=3888 */
     g_autofree G_GNUC_UNUSED bool *bitmaps = NULL;
-    NBDExportMetaContexts local_meta = {0};
+    NBDMetaContexts local_meta = {0};
+    NBDMetaContexts *meta;
+    NBDExport *exp;
     uint32_t nb_queries;
     size_t i;
     size_t count = 0;
@@ -994,6 +982,9 @@ static int nbd_negotiate_meta_queries(NBDClient *client,
     if (client->opt == NBD_OPT_LIST_META_CONTEXT) {
         /* Only change the caller's meta on SET. */
         meta = &local_meta;
+    } else {
+        meta = &client->contexts;
+        client->context_exp = NULL;
     }

     g_free(meta->bitmaps);
@@ -1004,14 +995,15 @@ static int nbd_negotiate_meta_queries(NBDClient *client,
         return ret;
     }

-    meta->exp = nbd_export_find(export_name);
-    if (meta->exp == NULL) {
+    exp = nbd_export_find(export_name);
+    if (exp == NULL) {
         g_autofree char *sane_name = nbd_sanitize_name(export_name);

         return nbd_opt_drop(client, NBD_REP_ERR_UNKNOWN, errp,
                             "export '%s' not present", sane_name);
     }
-    meta->bitmaps = g_new0(bool, meta->exp->nr_export_bitmaps);
+    meta->nr_bitmaps = exp->nr_export_bitmaps;
+    meta->bitmaps = g_new0(bool, exp->nr_export_bitmaps);
     if (client->opt == NBD_OPT_LIST_META_CONTEXT) {
         bitmaps = meta->bitmaps;
     }
@@ -1027,13 +1019,13 @@ static int nbd_negotiate_meta_queries(NBDClient *client,
     if (client->opt == NBD_OPT_LIST_META_CONTEXT && !nb_queries) {
         /* enable all known contexts */
         meta->base_allocation = true;
-        meta->allocation_depth = meta->exp->allocation_depth;
-        if (meta->exp->nr_export_bitmaps) {
-            memset(meta->bitmaps, 1, meta->exp->nr_export_bitmaps);
+        meta->allocation_depth = exp->allocation_depth;
+        if (exp->nr_export_bitmaps) {
+            memset(meta->bitmaps, 1, meta->nr_bitmaps);
         }
     } else {
         for (i = 0; i < nb_queries; ++i) {
-            ret = nbd_negotiate_meta_query(client, meta, errp);
+            ret = nbd_negotiate_meta_query(client, exp, meta, errp);
             if (ret <= 0) {
                 return ret;
             }
@@ -1060,7 +1052,7 @@ static int nbd_negotiate_meta_queries(NBDClient *client,
         count++;
     }

-    for (i = 0; i < meta->exp->nr_export_bitmaps; i++) {
+    for (i = 0; i < meta->nr_bitmaps; i++) {
         const char *bm_name;
         g_autofree char *context = NULL;

@@ -1068,7 +1060,7 @@ static int nbd_negotiate_meta_queries(NBDClient *client,
             continue;
         }

-        bm_name = bdrv_dirty_bitmap_name(meta->exp->export_bitmaps[i]);
+        bm_name = bdrv_dirty_bitmap_name(exp->export_bitmaps[i]);
         context = g_strdup_printf("qemu:dirty-bitmap:%s", bm_name);

         ret = nbd_negotiate_send_meta_context(client, context,
@@ -1083,6 +1075,9 @@ static int nbd_negotiate_meta_queries(NBDClient *client,
     ret = nbd_negotiate_send_rep(client, NBD_REP_ACK, errp);
     if (ret == 0) {
         meta->count = count;
+        if (client->opt == NBD_OPT_SET_META_CONTEXT) {
+            client->context_exp = exp;
+        }
     }

     return ret;
@@ -1276,8 +1271,7 @@ static int nbd_negotiate_options(NBDClient *client, Error **errp)

             case NBD_OPT_LIST_META_CONTEXT:
             case NBD_OPT_SET_META_CONTEXT:
-                ret = nbd_negotiate_meta_queries(client, &client->export_meta,
-                                                 errp);
+                ret = nbd_negotiate_meta_queries(client, errp);
                 break;

             case NBD_OPT_EXTENDED_HEADERS:
@@ -1508,7 +1502,7 @@ void nbd_client_put(NBDClient *client)
             QTAILQ_REMOVE(&client->exp->clients, client, next);
             blk_exp_unref(&client->exp->common);
         }
-        g_free(client->export_meta.bitmaps);
+        g_free(client->contexts.bitmaps);
         g_free(client);
     }
 }
@@ -2479,6 +2473,8 @@ static int nbd_co_receive_request(NBDRequestData *req, NBDRequest *request,
                 return -ENOMEM;
             }
         }
+    } else if (request->type == NBD_CMD_BLOCK_STATUS) {
+        request->contexts = client->contexts;
     }

     if (payload_len) {
@@ -2702,11 +2698,11 @@ static coroutine_fn int nbd_handle_request(NBDClient *client,
                                           "need non-zero length", errp);
         }
         assert(client->extended_headers || request->len <= UINT32_MAX);
-        if (client->export_meta.count) {
+        if (request->contexts.count) {
             bool dont_fragment = request->flags & NBD_CMD_FLAG_REQ_ONE;
-            int contexts_remaining = client->export_meta.count;
+            int contexts_remaining = request->contexts.count;

-            if (client->export_meta.base_allocation) {
+            if (request->contexts.base_allocation) {
                 ret = nbd_co_send_block_status(client, request,
                                                blk_bs(exp->common.blk),
                                                request->from,
@@ -2719,7 +2715,7 @@ static coroutine_fn int nbd_handle_request(NBDClient *client,
                 }
             }

-            if (client->export_meta.allocation_depth) {
+            if (request->contexts.allocation_depth) {
                 ret = nbd_co_send_block_status(client, request,
                                                blk_bs(exp->common.blk),
                                                request->from, request->len,
@@ -2732,8 +2728,10 @@ static coroutine_fn int nbd_handle_request(NBDClient *client,
                 }
             }

+            assert(request->contexts.nr_bitmaps ==
+                   client->exp->nr_export_bitmaps);
             for (i = 0; i < client->exp->nr_export_bitmaps; i++) {
-                if (!client->export_meta.bitmaps[i]) {
+                if (!request->contexts.bitmaps[i]) {
                     continue;
                 }
                 ret = nbd_co_send_bitmap(client, request,
@@ -2749,6 +2747,10 @@ static coroutine_fn int nbd_handle_request(NBDClient *client,
             assert(!contexts_remaining);

             return 0;
+        } else if (client->contexts.count) {
+            return nbd_send_generic_reply(client, request, -EINVAL,
+                                          "CMD_BLOCK_STATUS payload not valid",
+                                          errp);
         } else {
             return nbd_send_generic_reply(client, request, -EINVAL,
                                           "CMD_BLOCK_STATUS not negotiated",
@@ -2825,6 +2827,10 @@ static coroutine_fn void nbd_trip(void *opaque)
     } else {
         ret = nbd_handle_request(client, &request, req->data, &local_err);
     }
+    if (request.type == NBD_CMD_BLOCK_STATUS &&
+        request.contexts.bitmaps != client->contexts.bitmaps) {
+        g_free(request.contexts.bitmaps);
+    }
     if (ret < 0) {
         error_prepend(&local_err, "Failed to send reply: ");
         goto disconnect;
-- 
2.38.1

