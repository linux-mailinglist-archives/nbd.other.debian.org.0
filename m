Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id CA82D9A27B6
	for <lists+nbd@lfdr.de>; Thu, 17 Oct 2024 18:00:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 84BAA20616; Thu, 17 Oct 2024 16:00:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Oct 17 16:00:11 2024
Old-Return-Path: <ming.lei@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.2 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_SBL_CSS autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9C4642061A
	for <lists-other-nbd@bendel.debian.org>; Thu, 17 Oct 2024 15:43:17 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.984 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.153, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_SBL_CSS=3.335]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id aq-C_xNEQfLU for <lists-other-nbd@bendel.debian.org>;
	Thu, 17 Oct 2024 15:43:12 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 6BC94205CC
	for <nbd@other.debian.org>; Thu, 17 Oct 2024 15:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729179787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lUy+NHCY90HFmiHuL5kBvzZvtUN1CcRm3oIFWnmLPRo=;
	b=cGWsXz3qre7AHZeQDnbrlL19XqvB/yN02rHaKcijNy2U8T05W0l/EwMa6G79i61N5YifVt
	JpNh4H9mlLuMgJdlCeK9PJxiwpWLWhryQe2kg8y5oJ/rlhLJxJuLawC1Aq2kJbjOiUxeTi
	DDPPhEjFeou+UespXAMjoq1bO+Uwj9k=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-260-K7FxqgiwN4SnUhSC_t5xfw-1; Thu,
 17 Oct 2024 11:43:03 -0400
X-MC-Unique: K7FxqgiwN4SnUhSC_t5xfw-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1361B197703D;
	Thu, 17 Oct 2024 15:43:02 +0000 (UTC)
Received: from fedora (unknown [10.72.116.14])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 00C731956086;
	Thu, 17 Oct 2024 15:42:55 +0000 (UTC)
Date: Thu, 17 Oct 2024 23:42:50 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Bart Van Assche <bvanassche@acm.org>, linux-block@vger.kernel.org,
	josef@toxicpanda.com, nbd@other.debian.org, eblake@redhat.com,
	vincent.chen@sifive.com, Leon Schuermann <leon@is.currently.online>,
	Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH] nbd: fix partial sending
Message-ID: <ZxEwelJ__pzSMDPo@fedora>
References: <20241017113614.2964389-1-ming.lei@redhat.com>
 <354b464e-4ae0-460b-b6d1-8ae208345bfa@acm.org>
 <140c4437-fea2-482b-a43f-4ffe6c35e3d2@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <140c4437-fea2-482b-a43f-4ffe6c35e3d2@kernel.dk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <9ynKGeoTeGJ.A.grhM.LSTEnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3175
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZxEwelJ__pzSMDPo@fedora
Resent-Date: Thu, 17 Oct 2024 16:00:11 +0000 (UTC)

On Thu, Oct 17, 2024 at 09:22:22AM -0600, Jens Axboe wrote:
> On 10/17/24 9:13 AM, Bart Van Assche wrote:
> > On 10/17/24 4:36 AM, Ming Lei wrote:
> >> +static blk_status_t nbd_send_pending_cmd(struct nbd_device *nbd,
> >> +        struct nbd_cmd *cmd)
> >> +{
> >> +    struct request *req = blk_mq_rq_from_pdu(cmd);
> >> +    unsigned long deadline = READ_ONCE(req->deadline);
> >> +    unsigned int wait_ms = 2;
> >> +    blk_status_t res;
> >> +
> >> +    WARN_ON_ONCE(test_bit(NBD_CMD_REQUEUED, &cmd->flags));
> >> +
> >> +    while (true) {
> >> +        res = nbd_send_cmd(nbd, cmd, cmd->index);
> >> +        if (res != BLK_STS_RESOURCE)
> >> +            return res;
> >> +        if (READ_ONCE(jiffies) + msecs_to_jiffies(wait_ms) >= deadline)
> >> +            break;
> >> +        msleep(wait_ms);
> >> +        wait_ms *= 2;
> >> +    }
> > 
> > I think that there are better solutions to wait until more data
> > can be sent, e.g. by using the kernel equivalent of the C library
> > function select().
> 
> It's vfs_poll() - but I don't think that'd be worth it here, the nbd
> driver sets BLK_MQ_F_BLOCKING anyway. Using a poll trigger for this
> would be a lot more complicated, and need quite a bit of support code.

Agree.

It is one unlikely event and not worth vfs_poll() here.

And the retry with exponential backoff wait should work just fine.


Thanks,
Ming

