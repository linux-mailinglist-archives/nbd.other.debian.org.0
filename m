Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7742CD6A
	for <lists+nbd@lfdr.de>; Tue, 28 May 2019 19:15:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 45257205D0; Tue, 28 May 2019 17:15:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue May 28 17:15:09 2019
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VERIFIED,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A7A8B206EA
	for <lists-other-nbd@bendel.debian.org>; Tue, 28 May 2019 16:58:08 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id t_NXNsAzygWF for <lists-other-nbd@bendel.debian.org>;
	Tue, 28 May 2019 16:58:05 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-vk1-xa42.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com [IPv6:2607:f8b0:4864:20::a42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id C9797206E4
	for <nbd@other.debian.org>; Tue, 28 May 2019 16:58:04 +0000 (UTC)
Received: by mail-vk1-xa42.google.com with SMTP id j124so4861591vkb.4
        for <nbd@other.debian.org>; Tue, 28 May 2019 09:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WD86kLDybsdQfA1DtayTKwNMqVa0rLyy2f7nqyQw8qg=;
        b=wyDZHKhr+yVm9KgPE6tQTdgA4iwGqTCmFL3YfnKUlBYX+v412GOR3Icm138K9DM5IT
         lrs1WADr98GngDUa6SfbkIi5Liqqdw/2YUmApufncRkJE1U1WavhpViIXri52MGyzhZa
         ojrqbwXHuUfcn5tjm/RZFEOOM+/iOM4qhIBY/qTcZJv+nyYjUv6l/us1HHQcX42+d8yl
         EAAbDs+dSrkRTVippz8RiF/K/NiCjclAmkIVpgc6iK2kwUczFAsUGOaWbv6lYGvnatr+
         DjHkDZ8+sGH3kl+5QVV8IhkYbazSmKBS73iq9xW20Dn7pKWtlrQFjklnF8+BApRMnxWe
         NuXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WD86kLDybsdQfA1DtayTKwNMqVa0rLyy2f7nqyQw8qg=;
        b=iTbbXUs8cV8h7uxxZ8tiBdfxZL3vqWMm63DCSnOQtr+ui0pPlNN0TTn0z/i9mDKfE4
         kUlRn4MsxX2uuF8xf/iMIKaCy4k8z6MQnozitIERGlUsc5ZASbJZVAoxRuAIqJ+Z2lCe
         7Am4EZWw8JdUMFNmq3FDnyeaYQOxAqnlSXAiNSJfwob6gPReMGRorN7kMyKVSxe7WBLA
         5a49DSP0udjuh5QiQT+xD8He4ugpW5O+q1/fgCR9Cqisz1GFkSzZcXGPJiDIcfzG30eF
         ohHccD0OW3JhaxN1WWOjkpys33cK/fEs0z0gg/+Zwc+W7nQT7mR82ysjkPsFF0b5VUQB
         lUNg==
X-Gm-Message-State: APjAAAV2aRU8OQGvL8t+ZK3LddVCU7wtXrQX8FEqrAyrvSAf50dXJJqg
	kkChZX55RpDi+SUndp6zhXQ2gQ==
X-Google-Smtp-Source: APXvYqxGHJzU2EIExSGCni1Bo00y0u7bjA2lt0NXX3c7EB/S+zgm2olMG6Lm1XLAplqz0qJCaQCkAg==
X-Received: by 2002:a1f:9746:: with SMTP id z67mr20863502vkd.19.1559062681555;
        Tue, 28 May 2019 09:58:01 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::6684])
        by smtp.gmail.com with ESMTPSA id d7sm6182567uae.6.2019.05.28.09.58.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 09:58:00 -0700 (PDT)
Date: Tue, 28 May 2019 12:57:59 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Yao Liu <yotta.liu@ucloud.cn>
Cc: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>,
	linux-block <linux-block@vger.kernel.org>,
	nbd <nbd@other.debian.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] nbd: fix connection timed out error after
 reconnecting to server
Message-ID: <20190528165758.zxfrv6fum4vwcv4e@MacBook-Pro-91.local>
References: <1558691036-16281-1-git-send-email-yotta.liu@ucloud.cn>
 <20190524130740.zfypc2j3q5e3gryr@MacBook-Pro-91.local.dhcp.thefacebook.com>
 <20190527180743.GA20702@192-168-150-246.7~>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190527180743.GA20702@192-168-150-246.7~>
User-Agent: NeoMutt/20180716
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <fn7UxFgz5lP.A.SJF.dyW7cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/545
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190528165758.zxfrv6fum4vwcv4e@MacBook-Pro-91.local
Resent-Date: Tue, 28 May 2019 17:15:09 +0000 (UTC)

On Tue, May 28, 2019 at 02:07:43AM +0800, Yao Liu wrote:
> On Fri, May 24, 2019 at 09:07:42AM -0400, Josef Bacik wrote:
> > On Fri, May 24, 2019 at 05:43:54PM +0800, Yao Liu wrote:
> > > Some I/O requests that have been sent succussfully but have not yet been
> > > replied won't be resubmitted after reconnecting because of server restart,
> > > so we add a list to track them.
> > > 
> > > Signed-off-by: Yao Liu <yotta.liu@ucloud.cn>
> > 
> > Nack, this is what the timeout stuff is supposed to handle.  The commands will
> > timeout and we'll resubmit them if we have alive sockets.  Thanks,
> > 
> > Josef
> > 
> 
> On the one hand, if num_connections == 1 and the only sock has dead,
> then we do nbd_genl_reconfigure to reconnect within dead_conn_timeout,
> nbd_xmit_timeout will not resubmit commands that have been sent
> succussfully but have not yet been replied. The log is as follows:
>  
> [270551.108746] block nbd0: Receive control failed (result -104)
> [270551.108747] block nbd0: Send control failed (result -32)
> [270551.108750] block nbd0: Request send failed, requeueing
> [270551.116207] block nbd0: Attempted send on invalid socket
> [270556.119584] block nbd0: reconnected socket
> [270581.161751] block nbd0: Connection timed out
> [270581.165038] block nbd0: shutting down sockets
> [270581.165041] print_req_error: I/O error, dev nbd0, sector 5123224 flags 8801
> [270581.165149] print_req_error: I/O error, dev nbd0, sector 5123232 flags 8801
> [270581.165580] block nbd0: Connection timed out
> [270581.165587] print_req_error: I/O error, dev nbd0, sector 844680 flags 8801
> [270581.166184] print_req_error: I/O error, dev nbd0, sector 5123240 flags 8801
> [270581.166554] block nbd0: Connection timed out
> [270581.166576] print_req_error: I/O error, dev nbd0, sector 844688 flags 8801
> [270581.167124] print_req_error: I/O error, dev nbd0, sector 5123248 flags 8801
> [270581.167590] block nbd0: Connection timed out
> [270581.167597] print_req_error: I/O error, dev nbd0, sector 844696 flags 8801
> [270581.168021] print_req_error: I/O error, dev nbd0, sector 5123256 flags 8801
> [270581.168487] block nbd0: Connection timed out
> [270581.168493] print_req_error: I/O error, dev nbd0, sector 844704 flags 8801
> [270581.170183] print_req_error: I/O error, dev nbd0, sector 5123264 flags 8801
> [270581.170540] block nbd0: Connection timed out
> [270581.173333] block nbd0: Connection timed out
> [270581.173728] block nbd0: Connection timed out
> [270581.174135] block nbd0: Connection timed out
>  
> On the other hand, if we wait nbd_xmit_timeout to handle resubmission,
> the I/O requests will have a big delay. For example, if timeout time is 30s,
> and from sock dead to nbd_genl_reconfigure returned OK we only spend
> 2s, the I/O requests will still be handled by nbd_xmit_timeout after 30s.

We have to wait for the full timeout anyway to know that the socket went down,
so it'll be re-submitted right away and then we'll wait on the new connection.

Now we could definitely have requests that were submitted well after the first
thing that failed, so their timeout would be longer than simply retrying them,
but we have no idea of knowing which ones timed out and which ones didn't.  This
way lies pain, because we have to matchup tags with handles.  This is why we
rely on the generic timeout infrastructure, so everything is handled correctly
without ending up with duplicate submissions/replies.  Thanks,

Josef

