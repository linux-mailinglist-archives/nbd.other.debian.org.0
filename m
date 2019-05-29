Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id A78472DF2B
	for <lists+nbd@lfdr.de>; Wed, 29 May 2019 16:06:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 82B7620851; Wed, 29 May 2019 14:06:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed May 29 14:06:08 2019
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VERIFIED,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0DCD7206F9
	for <lists-other-nbd@bendel.debian.org>; Wed, 29 May 2019 13:48:48 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 8qcb1vdpHW2T for <lists-other-nbd@bendel.debian.org>;
	Wed, 29 May 2019 13:48:43 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qt1-x841.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 650F22060D
	for <nbd@other.debian.org>; Wed, 29 May 2019 13:48:42 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id z19so2569024qtz.13
        for <nbd@other.debian.org>; Wed, 29 May 2019 06:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kAl0wzx3emq5wKGOIuk8klmmZ+hHoJ5g1tlBkCfT5tg=;
        b=R4r88s0eXEjfS9YMRowWrNd+cRCiduJQO1pvRiepcZuGWy/3m1B73VBAJP76M8dDVB
         +v9gwTpAzUVAqXDbZclLpm02dIpdmExYPVXnq1hUftt/EIiJhRgFVNtrC1XaRzA8EnG/
         IEmOQT3c2kzYINeyJ63Hk6ScLWmlJrbuLbWSvS5Q8XQ1SnHc0cMRtTt3izItgrZS4IXY
         7phNGHC2gk6us8ZnGmeQgyCNY2HhrqwXScKEUu95Y1cE7j5v7pYDBSdZ9SvppTEDPJe6
         tB7cctT7bMqLI/7A15dqStcWlHbJKvBBco0e6b0q+rpcK/vofMClsCyrZv7vhwKnods/
         A7jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kAl0wzx3emq5wKGOIuk8klmmZ+hHoJ5g1tlBkCfT5tg=;
        b=Bkc0fbPbP7V17uNrDdSVRbuo6LbSI5M9EXgDaLyRYtGVQ9ki8wpdz9LNVgRoPWGgaD
         Ztcse9L7569oa+fg2t2SSP9OBj3mrQ238B7mBFsO+bkQMmv166TXcjN13N6HgpJu5kGP
         ibV+J50u9XucSx+DgD/+THrnAccgzPXUa3cSdQmEkzxZuX1LzZJzGVKn7N8EaBaphBrx
         1xmzjqbWtYHIlWAXqp5ALRFV7NONsDRBYQo07AD1MRZFhMx54oxKuAnSdmwkeTleThr0
         OXdcU2G7M9QnOm5lGdpDt1tLeXHyAjnAdegAjz+SMIEqTs0jC7ouSzXNDRQT/PmraYik
         nPOQ==
X-Gm-Message-State: APjAAAXEd/mPYsC1HSiPI+NJV61Eb/KBQPNl6FpXLhmT7c/dLQZp6waq
	Z51+w7m8KA1bfXo+dvmBX2hF+A==
X-Google-Smtp-Source: APXvYqyB5eTIW4f7w0P+quiFs0g3fOGgLPjkmAr1nafYPMij/uj1upXVI9fk2rxr9TJcYXzskqXWew==
X-Received: by 2002:a0c:8042:: with SMTP id 60mr30581196qva.238.1559137718918;
        Wed, 29 May 2019 06:48:38 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::d8f])
        by smtp.gmail.com with ESMTPSA id c5sm1276114qtj.27.2019.05.29.06.48.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 May 2019 06:48:37 -0700 (PDT)
Date: Wed, 29 May 2019 09:48:36 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: xiubli@redhat.com
Cc: josef@toxicpanda.com, axboe@kernel.dk, nbd@other.debian.org,
	mchristi@redhat.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, atumball@redhat.com
Subject: Re: [RFC PATCH] nbd: set the default nbds_max to 0
Message-ID: <20190529134834.t6qjq2nkut37zpsf@MacBook-Pro-91.local>
References: <20190529080836.13031-1-xiubli@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190529080836.13031-1-xiubli@redhat.com>
User-Agent: NeoMutt/20180716
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <VajpwHCymbH.A.2vC.QHp7cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/549
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190529134834.t6qjq2nkut37zpsf@MacBook-Pro-91.local
Resent-Date: Wed, 29 May 2019 14:06:08 +0000 (UTC)

On Wed, May 29, 2019 at 04:08:36PM +0800, xiubli@redhat.com wrote:
> From: Xiubo Li <xiubli@redhat.com>
> 
> There is one problem that when trying to check the nbd device
> NBD_CMD_STATUS and at the same time insert the nbd.ko module,
> we can randomly get some of the 16 /dev/nbd{0~15} are connected,
> but they are not. This is because that the udev service in user
> space will try to open /dev/nbd{0~15} devices to do some sanity
> check when they are added in "__init nbd_init()" and then close
> it asynchronousely.
> 
> Signed-off-by: Xiubo Li <xiubli@redhat.com>
> ---
> 
> Not sure whether this patch make sense here, coz this issue can be
> avoided by setting the "nbds_max=0" when inserting the nbd.ko modules.
> 

Yeah I'd rather not make this the default, as of right now most people still
probably use the old method of configuration and it may surprise them to
suddenly have to do nbds_max=16 to make their stuff work.  Thanks,

Josef

