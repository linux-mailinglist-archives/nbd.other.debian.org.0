Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F32A4BC885
	for <lists+nbd@lfdr.de>; Sat, 19 Feb 2022 14:21:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D40F0203B6; Sat, 19 Feb 2022 13:21:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Feb 19 13:21:10 2022
Old-Return-Path: <xieyongji@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C7A2C2041E
	for <lists-other-nbd@bendel.debian.org>; Sat, 19 Feb 2022 13:04:44 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.99 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 8kmTJCkYFtN6 for <lists-other-nbd@bendel.debian.org>;
	Sat, 19 Feb 2022 13:04:39 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-ej1-x62e.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 475A6203F9
	for <nbd@other.debian.org>; Sat, 19 Feb 2022 13:04:38 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id p14so21320501ejf.11
        for <nbd@other.debian.org>; Sat, 19 Feb 2022 05:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mH91QnSgxvC4j5tu0SPLOYxEGaLIR81KrmQMR9S7wsg=;
        b=GFjCtYbL40cTtZhkRLv9Bl1jLjTTM36g7Wt3xQ0smUg5bGzLv9E1pwR4fAckTgHoqs
         8COpCaHy87WGC3yIAe54CvV7KRCJ0VtUazzfkDnKaHSyIDfspsA0GTOsYPyatHZ0iX9t
         lPoKXa9riR3D4fuQ77JqbCIzxiMUNSWEBIdd0U1/Br8n62Es9vXtsAP5w75XjP22Yj61
         0bEN3oHO9B3zR3z/O3gqVdvu2ZOoCZH0afVP1Cth+DXYJwmkEDLdCGnSXFTqSMXoqr+G
         8Pkz0ziPHqFarTPwkQnMqPlt2918aQQCnCH0z+tYwqkC5q76w0r2ohY3h+1QvSyoB/Xo
         ysZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mH91QnSgxvC4j5tu0SPLOYxEGaLIR81KrmQMR9S7wsg=;
        b=dVnYhKGd7VCwEtCP8QEHf98yQyYwbBJAvNBf4NXRlR/BYyxtj07E2EswWyGg8je+j+
         Wdqyqmu+iC7QOOroQ3D3UdY34jw/sPMj+vwUsk01mNThoUTv7BbosXQxpkUmxf+6lNTm
         73uw1ePvZqC4Qp1//W8fpn9n7u2xXc7n0XsztObsxHAdfbYGhpbvuvUHIoYXxeLWHdkn
         gjNJhIdF9mSuKXBh+hOtwZIAx4E5EfNN0vKzt86hvUIaPqj4+SwzeQUce8fVQzky2fl9
         zEWZNMsANdzGoLy/oZ7IEmKzl9zpviOhadYehSNLFIjwfr7cDov2vv5Q4BTEa8WFs4h3
         gi/w==
X-Gm-Message-State: AOAM5319me3mqLO+70OQTOicXEUbpR94W/g5xBXASYMo2OPbGFHLyOT5
	zfEypztWb4oyYmr7v+Y6t8pFkSbwEu0h92bgOORJ
X-Google-Smtp-Source: ABdhPJwYkmpv/EhorhkTuYLKx9EBKD276hUEjdkS5jrdu+Di08dfQayG61gRGyXD2ykmkvTRM7hpzIjgw2YHfNfLiVM=
X-Received: by 2002:a17:906:974e:b0:6bb:4f90:a6ae with SMTP id
 o14-20020a170906974e00b006bb4f90a6aemr10115442ejy.452.1645275875999; Sat, 19
 Feb 2022 05:04:35 -0800 (PST)
MIME-Version: 1.0
References: <20211227091241.103-1-xieyongji@bytedance.com> <Ycycda8w/zHWGw9c@infradead.org>
 <CACycT3usfTdzmK=gOsBf3=-0e8HZ3_0ZiBJqkWb_r7nki7xzYA@mail.gmail.com>
 <YdMgCS1RMcb5V2RJ@localhost.localdomain> <CACycT3vYt0XNV2GdjKjDS1iyWieY_OV4h=W1qqk_AAAahRZowA@mail.gmail.com>
 <YdSMqKXv0PUkAwfl@localhost.localdomain> <CACycT3tPZOSkCXPz-oYCXRJ_EOBs3dC0+Juv=FYsa6qRS0GVCw@mail.gmail.com>
 <CACycT3tTKBpS_B5vVJ8MZ1iuaF2bf-01=9+tAdxUddziF2DQ-g@mail.gmail.com>
 <CACycT3thVwb466u2JR-oDRHLY5j_uxAx5uXXGmaoCZL5vs__mQ@mail.gmail.com> <Yg+5Wytvc2eG8uLD@localhost.localdomain>
In-Reply-To: <Yg+5Wytvc2eG8uLD@localhost.localdomain>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Sat, 19 Feb 2022 21:04:25 +0800
Message-ID: <CACycT3umMYfwVZRXinEBM=Kh+kQPYH5GBN6eKrt9unZSM8W0qw@mail.gmail.com>
Subject: Re: [PATCH v2] nbd: Don't use workqueue to handle recv work
To: Josef Bacik <josef@toxicpanda.com>
Cc: Christoph Hellwig <hch@infradead.org>, Jens Axboe <axboe@kernel.dk>, 
	Bart Van Assche <bvanassche@acm.org>, linux-block@vger.kernel.org, nbd@other.debian.org, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Ea9oFot_QVP.A.XAG.G7OEiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1716
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CACycT3umMYfwVZRXinEBM=Kh+kQPYH5GBN6eKrt9unZSM8W0qw@mail.gmail.com
Resent-Date: Sat, 19 Feb 2022 13:21:10 +0000 (UTC)

On Fri, Feb 18, 2022 at 11:21 PM Josef Bacik <josef@toxicpanda.com> wrote:
>
> On Tue, Feb 15, 2022 at 09:17:37PM +0800, Yongji Xie wrote:
> > Ping again.
> >
> > Hi Josef, could you take a look?
>
> Sorry Yongji this got lost.  Again in the reconnect case we're still setting up
> a long running thread, so it's not like it'll happen during a normal reclaim
> path thing, it'll be acted upon by userspace.  Thanks,
>

During creating this long running thread, we might trigger memory
reclaim since workqueue will use GFP_KERNEL allocation for it. Then a
deadlock can occur if the memory reclaim happens to hit the page cache
on this reconnecting nbd device.

Thanks,
Yongji

