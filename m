Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5016DCA61
	for <lists+nbd@lfdr.de>; Mon, 10 Apr 2023 20:06:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5B24E207F7; Mon, 10 Apr 2023 18:06:53 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Apr 10 18:06:53 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2 autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 439E4207AA
	for <lists-other-nbd@bendel.debian.org>; Mon, 10 Apr 2023 18:06:35 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.082 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Fwi_7NzBQR7g for <lists-other-nbd@bendel.debian.org>;
	Mon, 10 Apr 2023 18:06:27 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 5E4CC207DA
	for <nbd@other.debian.org>; Mon, 10 Apr 2023 18:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681149982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oA7vC3IC/UfWw/nU7DhHbrgbZ80ejmkeIuMD8WFpxCo=;
	b=fbTea1tvJAl2GOFhdu41ukmwW+eBtEm3GRIPI8gghvEBEGIYB8AdRG/GnZW2xohgtdNLH2
	00LZslQkqYzS1QMiEKBpHY4p5xy/xZw1/iexbrRSs8ims+RTvwJGkLxuhjemXez4xGwmNo
	tTNMUla7+czVS0XIFk6RZbJOWJaPbdc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-S3Uh7-YpMo2AMJpLLugL-A-1; Mon, 10 Apr 2023 14:06:18 -0400
X-MC-Unique: S3Uh7-YpMo2AMJpLLugL-A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3822985A5B1;
	Mon, 10 Apr 2023 18:06:18 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.95])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7DA0C492C13;
	Mon, 10 Apr 2023 18:06:17 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: josef@toxicpanda.com,
	linux-block@vger.kernel.org,
	nbd@other.debian.org
Cc: philipp.reisner@linbit.com,
	lars.ellenberg@linbit.com,
	christoph.boehmwalder@linbit.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] block nbd: use req.cookie instead of req.handle
Date: Mon, 10 Apr 2023 13:06:10 -0500
Message-Id: <20230410180611.1051618-4-eblake@redhat.com>
In-Reply-To: <20230410180611.1051618-1-eblake@redhat.com>
References: <20230410180611.1051618-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <9shtgAEOF8M.A.N8B.9AFNkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2419
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230410180611.1051618-4-eblake@redhat.com
Resent-Date: Mon, 10 Apr 2023 18:06:53 +0000 (UTC)

The NBD spec was recently changed [1] to refer to the opaque client
identifier as a 'cookie' rather than a 'handle', but has for a much
longer time listed it as a 64-bit value, and declares that all values
in the NBD protocol are sent in network byte order (big-endian).

Because the value is opaque to the server, it doesn't usually matter
what endianness we send as the client - as long as we are consistent
that either we byte-swap on both write and read, or on neither, then
we can match server replies back to our requests.  That said, our
internal use of the cookie is as a 64-bit number (well, as two 32-bit
numbers concatenated together), rather than as 8 individual bytes; so
prior to this commit, we ARE leaking the native endianness of our
internals as a client out to the server.  We don't know of any server
that will actually inspect the opaque value and behave differently
depending on whether a little-endian or big-endian client is sending
requests, but since we DO log the cookie value, a wireshark capture of
the network traffic is easier to correlate back to the kernel traffic
of a big-endian host (where the u64 and char[8] representations are
the same) than of a little-endian host (where if wireshark honors the
NBD spec and displays a u64 in network byte order, it is byte-swapped
from what the kernel logged).

The fix in this patch is thus two-part: it now consistently uses
network byte order for the opaque value (no difference to a big-endian
machine, but an extra byteswap on a little-endian machine; probably in
the noise compared to the overhead of network traffic in general), and
now uses a 64-bit integer instead of char[8] as its preferred access
to the opaque value (direct assignment instead of memcpy()).

Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Josef Bacik <josef@toxicpanda.com>

---

v3: squash original 2/5 and 4/5 into one patch, to avoid intermediate
duplication through a tmp variable [Ming].  Josef's R-b added, since
the final outcome of the squash is unchanged.
---
 drivers/block/nbd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 592cfa8b765a..94ae85400b46 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -606,7 +606,7 @@ static int nbd_send_cmd(struct nbd_device *nbd, struct nbd_cmd *cmd, int index)
 		request.len = htonl(size);
 	}
 	handle = nbd_cmd_handle(cmd);
-	memcpy(request.handle, &handle, sizeof(handle));
+	request.cookie = cpu_to_be64(handle);

 	trace_nbd_send_request(&request, nbd->index, blk_mq_rq_from_pdu(cmd));

@@ -618,7 +618,7 @@ static int nbd_send_cmd(struct nbd_device *nbd, struct nbd_cmd *cmd, int index)
 	trace_nbd_header_sent(req, handle);
 	if (result < 0) {
 		if (was_interrupted(result)) {
-			/* If we havne't sent anything we can just return BUSY,
+			/* If we haven't sent anything we can just return BUSY,
 			 * however if we have sent something we need to make
 			 * sure we only allow this req to be sent until we are
 			 * completely done.
@@ -732,7 +732,7 @@ static struct nbd_cmd *nbd_handle_reply(struct nbd_device *nbd, int index,
 	u32 tag;
 	int ret = 0;

-	memcpy(&handle, reply->handle, sizeof(handle));
+	handle = be64_to_cpu(reply->cookie);
 	tag = nbd_handle_to_tag(handle);
 	hwq = blk_mq_unique_tag_to_hwq(tag);
 	if (hwq < nbd->tag_set.nr_hw_queues)
-- 
2.39.2

