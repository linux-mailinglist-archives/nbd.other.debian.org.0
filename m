Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB622DF2E
	for <lists+nbd@lfdr.de>; Wed, 29 May 2019 16:06:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B196D207A5; Wed, 29 May 2019 14:06:18 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed May 29 14:06:18 2019
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VERIFIED,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 51D53203D1
	for <lists-other-nbd@bendel.debian.org>; Wed, 29 May 2019 13:49:37 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id bpTxXqcPFOYe for <lists-other-nbd@bendel.debian.org>;
	Wed, 29 May 2019 13:49:33 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qk1-x743.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 0CA8D20390
	for <nbd@other.debian.org>; Wed, 29 May 2019 13:49:32 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id a132so1435307qkb.13
        for <nbd@other.debian.org>; Wed, 29 May 2019 06:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+Pq+EyzVMQUywjOkzMmPfTzQM4e0EdEY2GE/XNiKIwM=;
        b=M/zE/zUzf2NHNsmOi1WlLM7ggaufogVbv14p1kjnbzkN2KqvPl1S23nU/wKauqny2m
         bgbN+IN6aeJmZPzc80JfIpVFWP0pEZ5M9ZUNm3roKM7WGIkkxDPdcRGf9owSkfpkHhXr
         k7LyOXRxY84FpqITG3R1iy5s0ruot32UfYUO73SFr7lT3u0Ueg+QPDFY4LMshSWFQ83/
         mfABorq+A+/D5iUSEBGC6IeYPtdr9Efbk00DELTOFn2YL5tRq7uiMmJ7OEl2JQ6pgpjX
         OxWtZklMP7J8v5TFqbT93gx6AwI4wiSKaeYA+xjPTsgpIt9pyq2c5lKawLxqXjQ84I2c
         yUwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+Pq+EyzVMQUywjOkzMmPfTzQM4e0EdEY2GE/XNiKIwM=;
        b=M0F0/EgnkDgletvQr4awHBRDbpontP/K5ETHLp2QpzMrqgs8h7fvqxbtWlD5cABPzL
         gwI6K7Zq1r9nBpH6tQYzbKrRtfY65/uQNgk9SdVaRZK4QfUc3nqTDL7mlRTRH/5ryNip
         Ul+GJH+uHAzHBfuKMOW5FyD0wW8SRppMtjJEifpBVd318CJNwn1oVaE2+GAL8p6Ky9yZ
         cycEtOeZqJiYHOgFhdCLyfNT+OXXsmmutO4vnyL3G/4ovErg4LcmT6frqekN4E3JWOsQ
         S5pEnMqzWk3rRhpRjkyrbUsWMHlTB9HTc7RHiyn5rJ2Nt2Us6zaJEysj2fc+X9HHFtIo
         DyjA==
X-Gm-Message-State: APjAAAXYPaiZhj8+KSZrFD0pkBlecfpx48Ebo2QPugE7+F1uBxUXTVTl
	xigNaTGqHIoIqIiV0S5ii/rZHw==
X-Google-Smtp-Source: APXvYqyVcViDCVP80pog0PmCySWfQPT3Fqwm8n4msm5wl7ow2Px/+9HWlia9g58hN9/VMgAZRGrvng==
X-Received: by 2002:a37:bb43:: with SMTP id l64mr94305733qkf.305.1559137769862;
        Wed, 29 May 2019 06:49:29 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::d8f])
        by smtp.gmail.com with ESMTPSA id c4sm6132790qkd.24.2019.05.29.06.49.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 May 2019 06:49:29 -0700 (PDT)
Date: Wed, 29 May 2019 09:49:27 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Yao Liu <yotta.liu@ucloud.cn>
Cc: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>,
	linux-block <linux-block@vger.kernel.org>,
	nbd <nbd@other.debian.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] nbd: fix connection timed out error after
 reconnecting to server
Message-ID: <20190529134925.mgp5drfn6ifr3u4g@MacBook-Pro-91.local>
References: <1558691036-16281-1-git-send-email-yotta.liu@ucloud.cn>
 <20190524130740.zfypc2j3q5e3gryr@MacBook-Pro-91.local.dhcp.thefacebook.com>
 <20190527180743.GA20702@192-168-150-246.7~>
 <20190528165758.zxfrv6fum4vwcv4e@MacBook-Pro-91.local>
 <20190528190446.GA21513@192-168-150-246.7~>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190528190446.GA21513@192-168-150-246.7~>
User-Agent: NeoMutt/20180716
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <A2I1XIR7P0K.A.MyC.aHp7cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/550
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190529134925.mgp5drfn6ifr3u4g@MacBook-Pro-91.local
Resent-Date: Wed, 29 May 2019 14:06:18 +0000 (UTC)

On Wed, May 29, 2019 at 03:04:46AM +0800, Yao Liu wrote:
> On Tue, May 28, 2019 at 12:57:59PM -0400, Josef Bacik wrote:
> > On Tue, May 28, 2019 at 02:07:43AM +0800, Yao Liu wrote:
> > > On Fri, May 24, 2019 at 09:07:42AM -0400, Josef Bacik wrote:
> > > > On Fri, May 24, 2019 at 05:43:54PM +0800, Yao Liu wrote:
> > > > > Some I/O requests that have been sent succussfully but have not yet been
> > > > > replied won't be resubmitted after reconnecting because of server restart,
> > > > > so we add a list to track them.
> > > > > 
> > > > > Signed-off-by: Yao Liu <yotta.liu@ucloud.cn>
> > > > 
> > > > Nack, this is what the timeout stuff is supposed to handle.  The commands will
> > > > timeout and we'll resubmit them if we have alive sockets.  Thanks,
> > > > 
> > > > Josef
> > > > 
> > > 
> > > On the one hand, if num_connections == 1 and the only sock has dead,
> > > then we do nbd_genl_reconfigure to reconnect within dead_conn_timeout,
> > > nbd_xmit_timeout will not resubmit commands that have been sent
> > > succussfully but have not yet been replied. The log is as follows:
> > >  
> > > [270551.108746] block nbd0: Receive control failed (result -104)
> > > [270551.108747] block nbd0: Send control failed (result -32)
> > > [270551.108750] block nbd0: Request send failed, requeueing
> > > [270551.116207] block nbd0: Attempted send on invalid socket
> > > [270556.119584] block nbd0: reconnected socket
> > > [270581.161751] block nbd0: Connection timed out
> > > [270581.165038] block nbd0: shutting down sockets
> > > [270581.165041] print_req_error: I/O error, dev nbd0, sector 5123224 flags 8801
> > > [270581.165149] print_req_error: I/O error, dev nbd0, sector 5123232 flags 8801
> > > [270581.165580] block nbd0: Connection timed out
> > > [270581.165587] print_req_error: I/O error, dev nbd0, sector 844680 flags 8801
> > > [270581.166184] print_req_error: I/O error, dev nbd0, sector 5123240 flags 8801
> > > [270581.166554] block nbd0: Connection timed out
> > > [270581.166576] print_req_error: I/O error, dev nbd0, sector 844688 flags 8801
> > > [270581.167124] print_req_error: I/O error, dev nbd0, sector 5123248 flags 8801
> > > [270581.167590] block nbd0: Connection timed out
> > > [270581.167597] print_req_error: I/O error, dev nbd0, sector 844696 flags 8801
> > > [270581.168021] print_req_error: I/O error, dev nbd0, sector 5123256 flags 8801
> > > [270581.168487] block nbd0: Connection timed out
> > > [270581.168493] print_req_error: I/O error, dev nbd0, sector 844704 flags 8801
> > > [270581.170183] print_req_error: I/O error, dev nbd0, sector 5123264 flags 8801
> > > [270581.170540] block nbd0: Connection timed out
> > > [270581.173333] block nbd0: Connection timed out
> > > [270581.173728] block nbd0: Connection timed out
> > > [270581.174135] block nbd0: Connection timed out
> > >  
> > > On the other hand, if we wait nbd_xmit_timeout to handle resubmission,
> > > the I/O requests will have a big delay. For example, if timeout time is 30s,
> > > and from sock dead to nbd_genl_reconfigure returned OK we only spend
> > > 2s, the I/O requests will still be handled by nbd_xmit_timeout after 30s.
> > 
> > We have to wait for the full timeout anyway to know that the socket went down,
> > so it'll be re-submitted right away and then we'll wait on the new connection.
> > 
> > Now we could definitely have requests that were submitted well after the first
> > thing that failed, so their timeout would be longer than simply retrying them,
> > but we have no idea of knowing which ones timed out and which ones didn't.  This
> > way lies pain, because we have to matchup tags with handles.  This is why we
> > rely on the generic timeout infrastructure, so everything is handled correctly
> > without ending up with duplicate submissions/replies.  Thanks,
> > 
> > Josef
> > 
> 
> But as I mentioned before, if num_connections == 1, nbd_xmit_timeout won't re-submit
> commands and I/O error will occur. Should we change the condition
> 		if (config->num_connections > 1)
> to
> 		if (config->num_connections >= 1)
> ?

Only if you don't have the patch 3 in place though right?  If you fix patch 3 to
allow requeuing if you have a dead connection timer set then you can requeue and
everything is a-ok.  Thanks,

Josef

