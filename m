Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id D609799EADF
	for <lists+nbd@lfdr.de>; Tue, 15 Oct 2024 15:00:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B9C0E206B3; Tue, 15 Oct 2024 13:00:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Oct 15 13:00:11 2024
Old-Return-Path: <ming.lei@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_SBL_CSS autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id CE20B206A5
	for <lists-other-nbd@bendel.debian.org>; Tue, 15 Oct 2024 12:42:28 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.084 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.153, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_SBL_CSS=3.335]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Cy2jkKCBPMrD for <lists-other-nbd@bendel.debian.org>;
	Tue, 15 Oct 2024 12:42:23 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 7D3CE206B9
	for <nbd@other.debian.org>; Tue, 15 Oct 2024 12:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728996138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G3Pcz/dEOnqKX/cFViUwxujJai8oBAzKnB5CGzzdEx0=;
	b=FflDfG1YsMzNXVLVBR7NDN+hVgtOGg8QHW/imo8AQD4mZgsTCW/84WEOMF6vo47FflvcDt
	PJYHbZ5iLwYJjYeZmnA86GLP/QEspneF7cit7WH6isIKD4T/pTFD4Za4+uAURUUJ4FcMq9
	2+Z3hSjC7RzTlMfF9b3rBeBBQntHj7w=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-205-hIfcxqtOOSO0A-W20qWf1g-1; Tue,
 15 Oct 2024 08:11:14 -0400
X-MC-Unique: hIfcxqtOOSO0A-W20qWf1g-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B8ED51956083;
	Tue, 15 Oct 2024 12:11:13 +0000 (UTC)
Received: from fedora (unknown [10.72.116.121])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9A2EA1956056;
	Tue, 15 Oct 2024 12:11:08 +0000 (UTC)
Date: Tue, 15 Oct 2024 20:11:02 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: josef@toxicpanda.com, axboe@kernel.dk, linux-block@vger.kernel.org,
	nbd@other.debian.org, eblake@redhat.com, ming.lei@redhat.com
Subject: Re: Kernel NBD client waits on wrong cookie, aborts connection
Message-ID: <Zw5b1mwk3aG01NTg@fedora>
References: <Zw5CNDIde6xkq_Sf@redhat.com>
 <CAFj5m9LXwcH7vc2Fk_i+VhfUA+tevzhciJzKc1am49y_5jgC2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFj5m9LXwcH7vc2Fk_i+VhfUA+tevzhciJzKc1am49y_5jgC2Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <oYaqTJ7lKoF.A.ci9.bdmDnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3165
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/Zw5b1mwk3aG01NTg@fedora
Resent-Date: Tue, 15 Oct 2024 13:00:11 +0000 (UTC)

On Tue, Oct 15, 2024 at 08:01:43PM +0800, Ming Lei wrote:
> On Tue, Oct 15, 2024 at 6:22 PM Kevin Wolf <kwolf@redhat.com> wrote:
> >
> > Hi all,
> >
> > the other day I was running some benchmarks to compare different QEMU
> > block exports, and one of the scenarios I was interested in was
> > exporting NBD from qemu-storage-daemon over a unix socket and attaching
> > it as a block device using the kernel NBD client. I would then run a VM
> > on top of it and fio inside of it.
> >
> > Unfortunately, I couldn't get any numbers because the connection always
> > aborted with messages like "Double reply on req ..." or "Unexpected
> > reply ..." in the host kernel log.
> >
> > Yesterday I found some time to have a closer look why this is happening,
> > and I think I have a rough understanding of what's going on now. Look at
> > these trace events:
> >
> >         qemu-img-51025   [005] ..... 19503.285423: nbd_header_sent: nbd transport event: request 000000002df03708, handle 0x0000150c0000005a
> > [...]
> >         qemu-img-51025   [008] ..... 19503.285500: nbd_payload_sent: nbd transport event: request 000000002df03708, handle 0x0000150c0000005d
> > [...]
> >    kworker/u49:1-47350   [004] ..... 19503.285514: nbd_header_received: nbd transport event: request 00000000b79e7443, handle 0x0000150c0000005a
> >
> > This is the same request, but the handle has changed between
> > nbd_header_sent and nbd_payload_sent! I think this means that we hit one
> > of the cases where the request is requeued, and then the next time it
> > is executed with a different blk-mq tag, which is something the nbd
> > driver doesn't seem to expect.
> >
> > Of course, since the cookie is transmitted in the header, the server
> > replies with the original handle that contains the tag from the first
> > call, while the kernel is only waiting for a handle with the new tag and
> > is confused by the server response.
> >
> > I'm not sure yet which of the following options should be considered the
> > real problem here, so I'm only describing the situation without trying
> > to provide a patch:
> >
> > 1. Is it that blk-mq should always re-run the request with the same tag?
> >    I don't expect so, though in practice I was surprised to see that it
> >    happens quite often after nbd requeues a request that it actually
> >    does end up with the same cookie again.
> 
> No.
> 
> request->tag will change, but we may take ->internal_tag(sched) or
> ->tag(none), which won't change.
> 
> I guess was_interrupted() in nbd_send_cmd() is triggered, then the payload
> is sent with a different tag.
> 
> I will try to cook one patch soon.

Please try the following patch:


diff --git a/block/blk-mq-tag.c b/block/blk-mq-tag.c
index 2cafcf11ee8b..e3eb31c3ee75 100644
--- a/block/blk-mq-tag.c
+++ b/block/blk-mq-tag.c
@@ -682,3 +682,16 @@ u32 blk_mq_unique_tag(struct request *rq)
 		(rq->tag & BLK_MQ_UNIQUE_TAG_MASK);
 }
 EXPORT_SYMBOL(blk_mq_unique_tag);
+
+/*
+ * Same with blk_mq_unique_tag, but one persistent tag is included in
+ * the request lifetime.
+ */
+u32 blk_mq_unique_static_tag(struct request *rq)
+{
+	u32 tag = rq->q->elevator ? rq->internal_tag : rq->tag;
+
+	return (rq->mq_hctx->queue_num << BLK_MQ_UNIQUE_TAG_BITS) |
+		(tag & BLK_MQ_UNIQUE_TAG_MASK);
+}
+EXPORT_SYMBOL(blk_mq_unique_static_tag);
diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index b852050d8a96..cc522a2cb9fb 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -201,7 +201,7 @@ static void nbd_requeue_cmd(struct nbd_cmd *cmd)
 static u64 nbd_cmd_handle(struct nbd_cmd *cmd)
 {
 	struct request *req = blk_mq_rq_from_pdu(cmd);
-	u32 tag = blk_mq_unique_tag(req);
+	u32 tag = blk_mq_unique_static_tag(req);
 	u64 cookie = cmd->cmd_cookie;
 
 	return (cookie << NBD_COOKIE_BITS) | tag;
diff --git a/include/linux/blk-mq.h b/include/linux/blk-mq.h
index 4fecf46ef681..d6266759d62d 100644
--- a/include/linux/blk-mq.h
+++ b/include/linux/blk-mq.h
@@ -793,6 +793,7 @@ enum {
 };
 
 u32 blk_mq_unique_tag(struct request *rq);
+u32 blk_mq_unique_static_tag(struct request *rq);
 
 static inline u16 blk_mq_unique_tag_to_hwq(u32 unique_tag)
 {

-- 
Ming

