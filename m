Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CE6A0AD1C
	for <lists+nbd@lfdr.de>; Mon, 13 Jan 2025 02:30:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A15A120679; Mon, 13 Jan 2025 01:30:23 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jan 13 01:30:23 2025
Old-Return-Path: <ming.lei@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4A0B1204E2
	for <lists-other-nbd@bendel.debian.org>; Mon, 13 Jan 2025 01:14:41 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.539 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.34, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id oNmaKMuzdIxa for <lists-other-nbd@bendel.debian.org>;
	Mon, 13 Jan 2025 01:14:37 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 8479E204B6
	for <nbd@other.debian.org>; Mon, 13 Jan 2025 01:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736730872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iXMkz/JmMlxojD1cmP+1yU3VwjLHjPli7o7LqzHtc3M=;
	b=deq29BHHziKUZj+QQs6CBGiGTan8mHteTD/+k4nJgydYMDi++sLt9VZnCuZXiz3pobS//R
	/gSjz81stXLPDzkUxnv2PrgjQuw3imyF/1hqXRqCDlEPuW8Gr2RldmbTPxRTSc3yiJpCJQ
	ngp5kKIUGdWZ3kVMOoy5NO4JHLPLDUg=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-634-MZ6xAsjvNwaR0HUfwDbKyw-1; Sun,
 12 Jan 2025 20:14:28 -0500
X-MC-Unique: MZ6xAsjvNwaR0HUfwDbKyw-1
X-Mimecast-MFC-AGG-ID: MZ6xAsjvNwaR0HUfwDbKyw
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4E7511956087;
	Mon, 13 Jan 2025 01:14:26 +0000 (UTC)
Received: from fedora (unknown [10.72.116.56])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1B65719560AD;
	Mon, 13 Jan 2025 01:14:19 +0000 (UTC)
Date: Mon, 13 Jan 2025 09:14:14 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>, Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, josef@toxicpanda.com, nbd@other.debian.org,
	eblake@redhat.com, vincent.chen@sifive.com,
	Leon Schuermann <leon@is.currently.online>,
	Bart Van Assche <bvanassche@acm.org>
Subject: Re: [PATCH V3] nbd: fix partial sending
Message-ID: <Z4Ro5sggod4WIJN0@fedora>
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
Resent-Message-ID: <23Orv-bCoBB.A.KdBL.vyGhnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3349
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/Z4Ro5sggod4WIJN0@fedora
Resent-Date: Mon, 13 Jan 2025 01:30:23 +0000 (UTC)

On Tue, Nov 05, 2024 at 03:03:06PM +0100, Kevin Wolf wrote:
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
 
Hello Jens,

Can you make this fix into v6.14 if you are fine?


Thanks,
Ming

