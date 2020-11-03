Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id A65792A4C8B
	for <lists+nbd@lfdr.de>; Tue,  3 Nov 2020 18:18:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8D94A2056D; Tue,  3 Nov 2020 17:18:20 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Nov  3 17:18:20 2020
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3FBFA20509
	for <lists-other-nbd@bendel.debian.org>; Tue,  3 Nov 2020 17:01:19 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.981 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Jm3iVw370-Pv for <lists-other-nbd@bendel.debian.org>;
	Tue,  3 Nov 2020 17:01:15 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qk1-x72c.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 38C45204D2
	for <nbd@other.debian.org>; Tue,  3 Nov 2020 17:01:14 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id r7so15337851qkf.3
        for <nbd@other.debian.org>; Tue, 03 Nov 2020 09:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Nq9emdk9/VH3etoKCshVdn5b0ODJscsHUoyYM3vXRsk=;
        b=m/Z4E4xllSTiWaEF9DMmkER2TYTqigEOfGHL8tnnebBSuZAllPym9m3FcE7VITk9zG
         AwaALaAeoBzD0bNlgrrzTgnK3a8hCFqMekzjEunGQWg8xpQlN/n9e+3GPgwwUxkzsHKh
         00/i0IUn9+23K+ZWY7xt1DAPoHL5odjunW4WIwkZbkQ/TMt04L+fe27+TavVv8rscymn
         Vc1zfbXtbtVW2nn8+M0cHGSO/NBUx9km4pADBe0dlitcVuHS8Qqe+EfU3O6jJ06BrkI8
         6C4M6X5D4h8/K9A7v3p+rTBPC0Pk94JuGNV1MiS84TrxoUHo3KDW8/fU94nOASGjstUS
         3VFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Nq9emdk9/VH3etoKCshVdn5b0ODJscsHUoyYM3vXRsk=;
        b=nRpgiVzBIDjTBlLJpCWXLrgY4K90uEmArgMaFIrehlsx0alzw506bWYEG4vu34uP8r
         loFdw7A5PxGOBZLQqkA4I9lAXkpNRzB2Gh2hPze2Dz8mxHHFLCRaf6XAV1rQZaZFz/H2
         DpxW7+nih4xn57Q89npALfewqmZqrtyjA+yP4CpOq2pdo9Z5vP+5XB9Dq+iWMkaSSBAA
         7r/FmJYzNGA7BOpnajuqNZC5InPOG3d2lssZSxCASRFid+rlG5p2tF4c++J6Hxwu81D8
         oVyD6+BKEahDq0xDKQIi/HGyTZnLxtmIKZfgsTILhSiKZ2oyES3ahhzwU0M/dsbvy4qZ
         Y7Rg==
X-Gm-Message-State: AOAM531OJTfRc7aB18sWSeCBWzpv0xrdecC3DGvvf64wDKDvW0yAknTe
	W9cfA+mSg0Ulnbi9JVYNGy4Dmw==
X-Google-Smtp-Source: ABdhPJx9uvhiDJfmYjsgwJSwPH9cXkjoyHlQhyl/BtA+7OFacC/7K2DwA11+kxnIGYs16+38zj8hEA==
X-Received: by 2002:a37:2784:: with SMTP id n126mr20725104qkn.477.1604422871347;
        Tue, 03 Nov 2020 09:01:11 -0800 (PST)
Received: from [192.168.1.45] (cpe-174-109-172-136.nc.res.rr.com. [174.109.172.136])
        by smtp.gmail.com with ESMTPSA id h4sm10820116qkl.82.2020.11.03.09.01.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2020 09:01:10 -0800 (PST)
Subject: Re: [PATCH v3 2/2] nbd: add comments about double lock for
 config_lock confusion
To: xiubli@redhat.com, axboe@kernel.dk, ming.lei@redhat.com
Cc: nbd@other.debian.org, linux-block@vger.kernel.org, jdillama@redhat.com,
 mgolub@suse.de
References: <20201103065156.342756-1-xiubli@redhat.com>
 <20201103065156.342756-3-xiubli@redhat.com>
From: Josef Bacik <josef@toxicpanda.com>
Message-ID: <cfea847e-8d60-ee61-3375-7637197ab8bc@toxicpanda.com>
Date: Tue, 3 Nov 2020 12:01:09 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201103065156.342756-3-xiubli@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <eesW2wWGt_H.A.g_G.cDZofB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1037
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/cfea847e-8d60-ee61-3375-7637197ab8bc@toxicpanda.com
Resent-Date: Tue,  3 Nov 2020 17:18:20 +0000 (UTC)

On 11/3/20 1:51 AM, xiubli@redhat.com wrote:
> From: Xiubo Li <xiubli@redhat.com>
> 
> When calling the ioctl(), fget() will be called on this fd, and
> nbd_release() is only called when the fd's refcount drops to zero.
> With this we can make sure that the nbd_release() won't be called
> before the ioctl() finished.
> 
> So there won't have the double lock issue for the "config_lock",
> which has already been held by nbd_ioctl().
> 
> Reviewed-by: Ming Lei <ming.lei@redhat.com>
> Signed-off-by: Xiubo Li <xiubli@redhat.com>

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

Thanks,

Josef

