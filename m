Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A2443C04B
	for <lists+nbd@lfdr.de>; Wed, 27 Oct 2021 04:51:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 479C8203BF; Wed, 27 Oct 2021 02:51:26 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Oct 27 02:51:26 2021
Old-Return-Path: <pkalever@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2 autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4F9E820257
	for <lists-other-nbd@bendel.debian.org>; Wed, 27 Oct 2021 02:34:46 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.93 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id TgDC-HfYKNig for <lists-other-nbd@bendel.debian.org>;
	Wed, 27 Oct 2021 02:34:41 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id EC685203BF
	for <nbd@other.debian.org>; Wed, 27 Oct 2021 02:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635302076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UBzGUnOUEFcF6KLWEluzYL4mLQjg1E6PUhcyyR60VNU=;
	b=gXowq9xhj2ljcG1qnOhwGGHzg1rJfHsGWMRJERSEYz6FwqncuPMXWXCvl9Dlr0iZesLZiy
	FYyW4npjS/bRrA3HoTXf9uAJ7DKXGVRxeEZ4nCYC14e3oZi85sHWLqsM6GNbGAle+ulEUf
	dOMAOykTY5Y67ixdFkEjGv4FFaVBFB8=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-pChlwYRDNa-6a4cpFmH1WA-1; Tue, 26 Oct 2021 22:18:40 -0400
X-MC-Unique: pChlwYRDNa-6a4cpFmH1WA-1
Received: by mail-lf1-f72.google.com with SMTP id x7-20020a056512130700b003fd1a7424a8so640538lfu.5
        for <nbd@other.debian.org>; Tue, 26 Oct 2021 19:18:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UBzGUnOUEFcF6KLWEluzYL4mLQjg1E6PUhcyyR60VNU=;
        b=MOcfHsWgsin3v9b36QltORS6AUX9d2KiiF5B3r5H11GzbRTeFZYOZM5WmA9hFaq5N0
         BLMdg9sXZDeJ1i91ZA+XNPZqs0BjduhGwJlqbh0k3uuloXT7tdIcvzEyHLOmJss/6UeZ
         T7ILnKP68gV5NY+LhkahlOQlrlIPczXjW8DSrNlkWA7bnjKGbNskgiyG79pRPdeNM6gw
         tXpHV7rDSt/c5lf7sfDlrUVA1dvOn5W2tNZ/IKHL82b5PHtHFaDxu82InaAz18nhYyCi
         cBlNiN+5bj0WXHAn18HPuFT692yu9dcBGZFVexkEqYM5RsNPo6YbwP51bX3U4sEsCnia
         +mhA==
X-Gm-Message-State: AOAM531cioRR4vN/6uch+KtHF5wT3rSDirOue+Ynn6p0oWHqiz76QTZL
	K3X5hXSAcIMjY9Klmg/uKg6PHtdtOP4t1jYDNFiXl3eL+5mGflMLV4/tpCgbH8nIL+Osn0j/bTC
	+qrPWUmDxyme54PjWO6IhUG5ho/zSyg==
X-Received: by 2002:a2e:80cc:: with SMTP id r12mr29943460ljg.448.1635301118964;
        Tue, 26 Oct 2021 19:18:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+WkJqJ7pHPSdrcPy5Ze4mNvUI2dJhewRaerkMzgGNgWAOUKSx17NXREubDi/lXrB/ymdEoifp1TYQO2vnjlk=
X-Received: by 2002:a2e:80cc:: with SMTP id r12mr29943446ljg.448.1635301118723;
 Tue, 26 Oct 2021 19:18:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210806142914.70556-1-pkalever@redhat.com> <20210806142914.70556-2-pkalever@redhat.com>
 <YUL+1PE1z5aM0eTM@T590>
In-Reply-To: <YUL+1PE1z5aM0eTM@T590>
From: Prasanna Kalever <pkalever@redhat.com>
Date: Wed, 27 Oct 2021 07:48:27 +0530
Message-ID: <CANwsLLEgHhrh7uh+awJp-qs8xxxpwQBc6fMkEys3VMU4anvWZg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] block: cleanup: define default command timeout and
 use it
To: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, nbd@other.debian.org
Cc: Ilya Dryomov <idryomov@redhat.com>, Xiubo Li <xiubli@redhat.com>, 
	Prasanna Kumar Kalever <prasanna.kalever@redhat.com>, Ming Lei <ming.lei@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkalever@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <rzWP6W5w07B.A.ynG.u6LehB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1582
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CANwsLLEgHhrh7uh+awJp-qs8xxxpwQBc6fMkEys3VMU4anvWZg@mail.gmail.com
Resent-Date: Wed, 27 Oct 2021 02:51:26 +0000 (UTC)

On Thu, Sep 16, 2021 at 1:52 PM Ming Lei <ming.lei@redhat.com> wrote:
>
> On Fri, Aug 06, 2021 at 07:59:13PM +0530, pkalever@redhat.com wrote:
> > From: Prasanna Kumar Kalever <prasanna.kalever@redhat.com>
> >
> > defined BLK_DEFAULT_CMD_TIMEOUT and reuse it everywhere else.
> >
> > Signed-off-by: Prasanna Kumar Kalever <prasanna.kalever@redhat.com>
> > ---
>
> Reviewed-by: Ming Lei <ming.lei@redhat.com>

Thanks for the review Ming.

Attempting to bring this to the top again for more reviews/acks.


BRs,
--
Prasanna

>
> --
> Ming
>

