Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C29A064FA
	for <lists+nbd@lfdr.de>; Wed,  8 Jan 2025 20:00:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 084392069D; Wed,  8 Jan 2025 19:00:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jan  8 19:00:12 2025
Old-Return-Path: <kwolf@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E69CD206A3
	for <lists-other-nbd@bendel.debian.org>; Wed,  8 Jan 2025 18:42:55 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.539 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.34, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id CxKek9zC-mul for <lists-other-nbd@bendel.debian.org>;
	Wed,  8 Jan 2025 18:42:50 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 206BF2067D
	for <nbd@other.debian.org>; Wed,  8 Jan 2025 18:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736361765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pfcBsLMpgBBjs+6gd7rLtqgcpV31/V32k2ExVRnnv8I=;
	b=QsQLjcgWdfKJUkL8NcZnKmcY6XaNiEL9ONd+c1965gRcbvV9j5NmbuCtn7kV1ePzElr+Ow
	GH5OwnfPKkTHQfdFGbgVN4t7PFM1V/V4c7+GWMEFLgvJwtxhkXx0KjZT853Aqt59rTlJ6f
	CeTWQGh+DAPhde7jYQeDttBWsRJIa8k=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-617-T4LAYx6rOoy4Ib0IKqH2cA-1; Wed,
 08 Jan 2025 13:04:34 -0500
X-MC-Unique: T4LAYx6rOoy4Ib0IKqH2cA-1
X-Mimecast-MFC-AGG-ID: T4LAYx6rOoy4Ib0IKqH2cA
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E741E1979053;
	Wed,  8 Jan 2025 18:04:32 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.62])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B59D119560AD;
	Wed,  8 Jan 2025 18:04:29 +0000 (UTC)
Date: Wed, 8 Jan 2025 19:04:27 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Ming Lei <ming.lei@redhat.com>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	josef@toxicpanda.com, nbd@other.debian.org, eblake@redhat.com,
	vincent.chen@sifive.com, Leon Schuermann <leon@is.currently.online>,
	Bart Van Assche <bvanassche@acm.org>
Subject: Re: [PATCH V3] nbd: fix partial sending
Message-ID: <Z36-GdPCdgdjwvHX@redhat.com>
References: <20241029011941.153037-1-ming.lei@redhat.com>
 <ZyolmjfJvYWmhcbS@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyolmjfJvYWmhcbS@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <-Oolpdns-GF.A.SsCD.8ssfnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3301
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/Z36-GdPCdgdjwvHX@redhat.com
Resent-Date: Wed,  8 Jan 2025 19:00:13 +0000 (UTC)

Am 05.11.2024 um 15:03 hat Kevin Wolf geschrieben:
> Am 29.10.2024 um 02:19 hat Ming Lei geschrieben:
> > nbd driver sends request header and payload with multiple call of
> > sock_sendmsg, and partial sending can't be avoided. However, nbd driver
> > returns BLK_STS_RESOURCE to block core in this situation. This way causes
> > one issue: request->tag may change in the next run of nbd_queue_rq(), but
> > the original old tag has been sent as part of header cookie, this way
> > confuses nbd driver reply handling, since the real request can't be
> > retrieved any more with the obsolete old tag.
> > 
> > Fix it by retrying sending directly in per-socket work function,
> > meantime return BLK_STS_OK to block layer core.
> > 
> > Cc: vincent.chen@sifive.com
> > Cc: Leon Schuermann <leon@is.currently.online>
> > Cc: Bart Van Assche <bvanassche@acm.org>
> > Reported-by: Kevin Wolf <kwolf@redhat.com>
> > Signed-off-by: Ming Lei <ming.lei@redhat.com>
> 
> > @@ -770,6 +798,14 @@ static blk_status_t nbd_send_cmd(struct nbd_device *nbd, struct nbd_cmd *cmd,
> >  	return BLK_STS_OK;
> >  
> >  requeue:
> > +	/*
> > +	 * Can't requeue in case we are dealing with partial send
> > +	 *
> > +	 * We must run from pending work function.
> > +	 * */
> > +	if (test_bit(NBD_CMD_PARTIAL_SEND, &cmd->flags))
> > +		return BLK_STS_OK;
> > +
> >  	/* retry on a different socket */
> >  	dev_err_ratelimited(disk_to_dev(nbd->disk),
> >  			    "Request send failed, requeueing\n");
> 
> This hunk doesn't feel ideal: The assumption in the normal code path
> here is that the socket is dead, i.e. the error isn't recoverable. With
> this way to handle it, nbd_pending_cmd_work() will keep retrying until
> the request finally times out. We could probably return an error right
> away.
> 
> In fact, I think even requeuing (and ideally still completing the
> request successfully in the end) would be fine in this case because
> we'll shut down the socket and never send any additional data on it, so
> the server will never see a complete command. We would just have to make
> sure that nbd_pending_cmd_work() doesn't try to complete sending the
> command any more.
> 
> But even though this error path isn't optimal, I feel it might be
> acceptable. Let's see if someone else has an opinion on it.
> 
> Tested-by: Kevin Wolf <kwolf@redhat.com>
> Reviewed-by: Kevin Wolf <kwolf@redhat.com>

What is the status with this fix? I don't see any further comments on it,
but it also doesn't seem to be merged yet. Am I missing a follow-up
thread?

Kevin

