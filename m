Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCAD527D8F
	for <lists+nbd@lfdr.de>; Mon, 16 May 2022 08:27:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 04D012031A; Mon, 16 May 2022 06:27:21 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon May 16 06:27:20 2022
Old-Return-Path: <xieyongji@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5408A202B1
	for <lists-other-nbd@bendel.debian.org>; Mon, 16 May 2022 06:11:52 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.99 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id N0-PxC6xD2JJ for <lists-other-nbd@bendel.debian.org>;
	Mon, 16 May 2022 06:11:47 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-ej1-x62d.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 15C65202C0
	for <nbd@other.debian.org>; Mon, 16 May 2022 06:11:43 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id kq17so26573054ejb.4
        for <nbd@other.debian.org>; Sun, 15 May 2022 23:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DDExltmJQGWG8ic0QFjNHARbqgfVm/8EvRKattKCXjs=;
        b=f+41nxPmWnF4eQ8C/CVQ5hE4qfEnRFusvKVYHkEZaBfWz8utQy293dT1v5CxIMxyL+
         UURKJ2FwAbMog5CbRi7nTUDI7llzpk7lZeaRFW7uVT5kiXaR2/9UoLLGpiHb/8I6WVjH
         jnqtqAasuLnJ0riAjZwXrsB/NGGdZhkEdKYDvzlC5MIJ7pIYNXeY69qhVnhWQ4XEsxs2
         mTPSrqZLTfcisM8WVUhHcqgaCRKq4wI1hOfxjtuXWGFlPE5JnmK20AcnjDdn0xSHFrP+
         WKJhymKRarwN1LFtNZt/UV7zIBG5tSTG43j6ko1YzXwTe7cpLf+rcHoIlhemVbapqMgx
         +Xhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DDExltmJQGWG8ic0QFjNHARbqgfVm/8EvRKattKCXjs=;
        b=sql6T84ADKOh2xCE9BCBKfYsD2cHG50bpVZCZ2tOBDPA0Sq8T1kYXwqvHUCYNFFucq
         5yHr1tCL0heed+mfK9uy8r5gQjKEcewhjgTG5AJ65mP6ZO6eHWVbZvF3YiKAi/9P0W7e
         do+OtBOnfnyA/EMb5t9EKG6z7CSzWWOsVimLawnYws2cTiL+SaZ7755tZ6p95oKRL5dh
         eVEwCvWdZz5fwBoRJisvTFL0hHlqiYhjZmv52ZpE/X1sNUcMhp5cz1KVBRjOqCqt/Upg
         cR8KXIv822mI3o9E5yVZvP/q76DzOEuZYlAw19c3hpPlwR9sT6nqgASk9PRkvxa0r275
         Z+Tw==
X-Gm-Message-State: AOAM533LTYWvaBUZXundIoSWJ8SWbijFGyHssTpkkOKs5CAj/Izeub+M
	o1PE5cxZinkWmHPEBSgfa2V17Q+byjRfLC4Ufke1
X-Google-Smtp-Source: ABdhPJybCyLqJWcm+ZRVJlnC9wn0Dk0JLtZaGocnjGqN649cF0rUiNK7Asn9oRZzaYCkJCV+17iuWsLc509n8gl1Hxw=
X-Received: by 2002:a17:906:7c96:b0:6f3:b6c4:7b2 with SMTP id
 w22-20020a1709067c9600b006f3b6c407b2mr13937840ejo.676.1652681500741; Sun, 15
 May 2022 23:11:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220322080639.142-1-xieyongji@bytedance.com> <Yjop+VdZi5xbHe+b@localhost.localdomain>
In-Reply-To: <Yjop+VdZi5xbHe+b@localhost.localdomain>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Mon, 16 May 2022 14:12:22 +0800
Message-ID: <CACycT3v=Gef6XyUN2=fAwV0+x+h5aeVF-z95=bbU1ziZ1oA9zw@mail.gmail.com>
Subject: Re: [PATCH] nbd: Fix hung on disconnect request if socket is closed before
To: Josef Bacik <josef@toxicpanda.com>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, nbd@other.debian.org, 
	=?UTF-8?B?5b6Q5bu65rW3?= <zero.xu@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <4uakAN0aeoB.A.eEC.I7egiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2071
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CACycT3v=Gef6XyUN2=fAwV0+x+h5aeVF-z95=bbU1ziZ1oA9zw@mail.gmail.com
Resent-Date: Mon, 16 May 2022 06:27:21 +0000 (UTC)

Ping.

On Wed, Mar 23, 2022 at 3:56 AM Josef Bacik <josef@toxicpanda.com> wrote:
>
> On Tue, Mar 22, 2022 at 04:06:39PM +0800, Xie Yongji wrote:
> > When userspace closes the socket before sending a disconnect
> > request, the following I/O requests will be blocked in
> > wait_for_reconnect() until dead timeout. This will cause the
> > following disconnect request also hung on blk_mq_quiesce_queue().
> > That means we have no way to disconnect a nbd device if there
> > are some I/O requests waiting for reconnecting until dead timeout.
> > It's not expected. So let's wake up the thread waiting for
> > reconnecting directly when a disconnect request is sent.
> >
> > Reported-by: Xu Jianhai <zero.xu@bytedance.com>
> > Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
>
> Reviewed-by: Josef Bacik <josef@toxicpanda.com>
>
> Thanks,
>
> Josef

